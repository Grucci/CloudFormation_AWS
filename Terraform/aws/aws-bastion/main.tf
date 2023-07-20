##################################
# BASTION AUTO-SCALING GROUP IAM
##################################
data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# IAM policy to allow attachment of EIP to EC2 instance. This is used by 
# the user_data.sh script to associate itself with the bastion elastic IP
data "aws_iam_policy_document" "eip_policy" {
  statement {
    sid = ""

    actions = [
      "ec2:DescribeAddresses",
      "ec2:DescribeInstances",
      "ec2:AssociateAddress",
      "ec2:AllocateAddress"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "bastion_eip_iam_policy" {
  name_prefix = "bastion_allow_eip_attachment"
  path        = "/"
  policy      = data.aws_iam_policy_document.eip_policy.json
}

resource "aws_iam_role" "bastion_iam_role" {
  name_prefix        = "bastion_allow_ec2"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json

  tags = merge(
    map("Name", "${var.name}-ROLE"),
    map("Terraform", "true"),
    var.extra_tags
  )
}

resource "aws_iam_policy_attachment" "iam_attach" {
  name       = "bastion-iam-attachment"
  roles      = [aws_iam_role.bastion_iam_role.name]
  policy_arn = aws_iam_policy.bastion_eip_iam_policy.arn
}

resource "aws_iam_instance_profile" "bastion_iam" {
  name_prefix = "bastion_iam"
  role        = aws_iam_role.bastion_iam_role.name
}

###############################
# BASTION SECURITY GROUP RULES
###############################
resource "aws_security_group" "bastion_sg" {
  name        = "${var.name}-SG"
  vpc_id      = var.vpc_id
  description = "Bastion security group (only SSH inbound access is allowed from allowed CIDR ranges)"

  tags = merge(
    map("Name", "${var.name}-SG"),
    map("Terraform", "true"),
    var.extra_tags
  )
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "ssh_sg_ingress" {
  count                    = length(var.allowed_security_groups)
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  source_security_group_id = element(var.allowed_security_groups, count.index)
  security_group_id        = aws_security_group.bastion_sg.id

}

resource "aws_security_group_rule" "bastion_all_egress" {
  type      = "egress"
  from_port = "0"
  to_port   = "65535"
  protocol  = "all"

  cidr_blocks = [
    "0.0.0.0/0",
  ]

  ipv6_cidr_blocks = [
    "::/0",
  ]

  security_group_id = aws_security_group.bastion_sg.id
}

###################################################
# EIP ASSIGNMENT TO ASG INSTANCE - USERDATA SCRIPT
###################################################
resource "aws_eip" "bastion_eip" {
  count = length(var.public_subnet_ids)
  vpc   = true

  tags = merge(
    map("Name", "${var.name}-EIP"),
    map("Terraform", "true"),
    var.extra_tags
  )
}

data "aws_region" "current" {}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")

  vars = {
    eip_ids                     = join("\" \"", aws_eip.bastion_eip.*.id)
    subnet_ids                  = join("\" \"", var.public_subnet_ids)
    additional_user_data_script = var.additional_user_data_script
    region                      = data.aws_region.current.name
  }
}

# Cloud-init script to allow users SSH permission
data "template_cloudinit_config" "bastion_userdata" {
  base64_encode = true
  gzip          = false

  part {
    content_type = "text/cloud-config"
    content      = var.cloudinit_userdata
  }
  # Load user_data.sh
  part {
    content      = data.template_file.user_data.rendered
    content_type = "text/x-shellscript"
  }
}

##############################
# BASTION INSTANCE DEFINITION
##############################
# Lookup AMI (AMI IDs vary by AWS region)
data "aws_ami" "found_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}



resource "aws_launch_configuration" "bastion_lc" {
  name_prefix       = var.name
  image_id          = coalesce(var.instance_ami, data.aws_ami.found_ami.id)
  instance_type     = var.instance_type
  user_data         = data.template_cloudinit_config.bastion_userdata.rendered
  enable_monitoring = var.enable_monitoring

  security_groups = flatten(["${aws_security_group.bastion_sg.id}", "${var.security_group_ids}"])

  root_block_device {
    volume_size = var.instance_volume_size_gb
  }

  iam_instance_profile        = aws_iam_instance_profile.bastion_iam.name
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name

  lifecycle {
    create_before_destroy = true
  }

}

#############################
# BASTION AUTO-SCALING GROUP
#############################
resource "aws_autoscaling_group" "bastion_asg" {
  name = "${aws_launch_configuration.bastion_lc.name}-ASG"

  vpc_zone_identifier = var.public_subnet_ids

  desired_capacity          = length(var.public_subnet_ids)
  min_size                  = length(var.public_subnet_ids)
  max_size                  = length(var.public_subnet_ids)
  health_check_grace_period = "60"
  health_check_type         = "EC2"
  force_delete              = false
  wait_for_capacity_timeout = 0
  launch_configuration      = aws_launch_configuration.bastion_lc.name

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]

  tags = ["${merge(
    map("key", "Name", "value", var.name, "propagate_at_launch", true),
    map("key", "Accessibility", "value", "Public", "propagate_at_launch", true),
    var.extra_tags
  )}"]

  lifecycle {
    create_before_destroy = true
  }
}
