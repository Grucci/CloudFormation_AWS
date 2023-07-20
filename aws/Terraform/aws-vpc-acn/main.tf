#####################
# Computed Variables
#####################
locals {
  vpc_name = "${var.environment_name}-VPC"
  igw_tags = { Name = "${var.environment_name}-IG" }

  # Accessibility - Public is required by ACP compliancy policy #59
  var_public_subnet_tags = merge(
    {
      "Name"          = format("%s-SUBNET-PUBLIC", var.environment_name),
      "Accessibility" = "Public"
    },
    var.public_subnet_tags,
    var.subnet_tags
  )

  var_private_subnet_tags = merge(
    {
      "Name" = format("%s-SUBNET-PRIVATE", var.environment_name),
    },
    var.private_subnet_tags,
    var.subnet_tags
  )

  # Accessibility - Public is required by ACP compliancy policy #59
  public_route_table_tags = merge(
    {
      "Name"          = format("%s-RT-PUBLIC", var.environment_name),
      "Accessibility" = "Public"
    }
  )

  private_route_table_tags = { Name = "${var.environment_name}-RT-PRIVATE" }
  log_group_name           = "${var.environment_name}-LOG-GROUP"
  flow_log_name            = "${var.environment_name}-FLOW-LOG"
}

############################
# VPC Definition
############################
module "this_vpc" {
  source = "git::https://innersource.accenture.com/scm/tfml/terraform-aws-vpc.git?ref=v2.7.0"

  # Custom Variables
  name                     = "${local.vpc_name}"
  igw_tags                 = "${local.igw_tags}"
  public_subnet_tags       = "${local.var_public_subnet_tags}"
  private_subnet_tags      = "${local.var_private_subnet_tags}"
  public_route_table_tags  = "${local.public_route_table_tags}"
  private_route_table_tags = "${local.private_route_table_tags}"

  # Pass-through Variables
  create_vpc                                        = "${var.create_vpc}"
  cidr                                              = "${var.cidr}"
  assign_generated_ipv6_cidr_block                  = "${var.assign_generated_ipv6_cidr_block}"
  secondary_cidr_blocks                             = "${var.secondary_cidr_blocks}"
  instance_tenancy                                  = "${var.instance_tenancy}"
  public_subnet_suffix                              = "${var.public_subnet_suffix}"
  private_subnet_suffix                             = "${var.private_subnet_suffix}"
  intra_subnet_suffix                               = "${var.intra_subnet_suffix}"
  database_subnet_suffix                            = "${var.database_subnet_suffix}"
  redshift_subnet_suffix                            = "${var.redshift_subnet_suffix}"
  elasticache_subnet_suffix                         = "${var.elasticache_subnet_suffix}"
  public_subnets                                    = "${var.public_subnets}"
  private_subnets                                   = "${var.private_subnets}"
  database_subnets                                  = "${var.database_subnets}"
  redshift_subnets                                  = "${var.redshift_subnets}"
  elasticache_subnets                               = "${var.elasticache_subnets}"
  intra_subnets                                     = "${var.intra_subnets}"
  create_database_subnet_route_table                = "${var.create_database_subnet_route_table}"
  create_redshift_subnet_route_table                = "${var.create_redshift_subnet_route_table}"
  enable_public_redshift                            = "${var.enable_public_redshift}"
  create_elasticache_subnet_route_table             = "${var.create_elasticache_subnet_route_table}"
  create_database_subnet_group                      = "${var.create_database_subnet_group}"
  create_elasticache_subnet_group                   = "${var.create_elasticache_subnet_group}"
  create_redshift_subnet_group                      = "${var.create_redshift_subnet_group}"
  create_database_internet_gateway_route            = "${var.create_database_internet_gateway_route}"
  create_database_nat_gateway_route                 = "${var.create_database_nat_gateway_route}"
  azs                                               = "${var.azs}"
  enable_dns_hostnames                              = "${var.enable_dns_hostnames}"
  enable_dns_support                                = "${var.enable_dns_support}"
  enable_nat_gateway                                = "${var.enable_nat_gateway}"
  single_nat_gateway                                = "${var.single_nat_gateway}"
  one_nat_gateway_per_az                            = "${var.one_nat_gateway_per_az}"
  reuse_nat_ips                                     = "${var.reuse_nat_ips}"
  external_nat_ip_ids                               = "${var.external_nat_ip_ids}"
  enable_dynamodb_endpoint                          = "${var.enable_dynamodb_endpoint}"
  enable_s3_endpoint                                = "${var.enable_s3_endpoint}"
  enable_sqs_endpoint                               = "${var.enable_sqs_endpoint}"
  sqs_endpoint_security_group_ids                   = "${var.sqs_endpoint_security_group_ids}"
  sqs_endpoint_subnet_ids                           = "${var.sqs_endpoint_subnet_ids}"
  sqs_endpoint_private_dns_enabled                  = "${var.sqs_endpoint_private_dns_enabled}"
  enable_ssm_endpoint                               = "${var.enable_ssm_endpoint}"
  ssm_endpoint_security_group_ids                   = "${var.ssm_endpoint_security_group_ids}"
  ssm_endpoint_subnet_ids                           = "${var.ssm_endpoint_subnet_ids}"
  ssm_endpoint_private_dns_enabled                  = "${var.ssm_endpoint_private_dns_enabled}"
  enable_ssmmessages_endpoint                       = "${var.enable_ssmmessages_endpoint}"
  enable_apigw_endpoint                             = "${var.enable_apigw_endpoint}"
  apigw_endpoint_security_group_ids                 = "${var.apigw_endpoint_security_group_ids}"
  apigw_endpoint_private_dns_enabled                = "${var.apigw_endpoint_private_dns_enabled}"
  apigw_endpoint_subnet_ids                         = "${var.apigw_endpoint_subnet_ids}"
  ssmmessages_endpoint_security_group_ids           = "${var.ssmmessages_endpoint_security_group_ids}"
  ssmmessages_endpoint_subnet_ids                   = "${var.ssmmessages_endpoint_subnet_ids}"
  ssmmessages_endpoint_private_dns_enabled          = "${var.ssmmessages_endpoint_private_dns_enabled}"
  enable_ec2_endpoint                               = "${var.enable_ec2_endpoint}"
  ec2_endpoint_security_group_ids                   = "${var.ec2_endpoint_security_group_ids}"
  ec2_endpoint_private_dns_enabled                  = "${var.ec2_endpoint_private_dns_enabled}"
  ec2_endpoint_subnet_ids                           = "${var.ec2_endpoint_subnet_ids}"
  enable_ec2messages_endpoint                       = "${var.enable_ec2messages_endpoint}"
  ec2messages_endpoint_security_group_ids           = "${var.ec2messages_endpoint_security_group_ids}"
  ec2messages_endpoint_private_dns_enabled          = "${var.ec2messages_endpoint_private_dns_enabled}"
  ec2messages_endpoint_subnet_ids                   = "${var.ec2messages_endpoint_subnet_ids}"
  enable_ecr_api_endpoint                           = "${var.enable_ecr_api_endpoint}"
  ecr_api_endpoint_subnet_ids                       = "${var.ecr_api_endpoint_subnet_ids}"
  ecr_api_endpoint_private_dns_enabled              = "${var.ecr_api_endpoint_private_dns_enabled}"
  ecr_api_endpoint_security_group_ids               = "${var.ecr_api_endpoint_security_group_ids}"
  enable_ecr_dkr_endpoint                           = "${var.enable_ecr_dkr_endpoint}"
  ecr_dkr_endpoint_subnet_ids                       = "${var.ecr_dkr_endpoint_subnet_ids}"
  ecr_dkr_endpoint_private_dns_enabled              = "${var.ecr_dkr_endpoint_private_dns_enabled}"
  ecr_dkr_endpoint_security_group_ids               = "${var.ecr_dkr_endpoint_security_group_ids}"
  enable_kms_endpoint                               = "${var.enable_kms_endpoint}"
  kms_endpoint_security_group_ids                   = "${var.kms_endpoint_security_group_ids}"
  kms_endpoint_subnet_ids                           = "${var.kms_endpoint_subnet_ids}"
  kms_endpoint_private_dns_enabled                  = "${var.kms_endpoint_private_dns_enabled}"
  enable_ecs_endpoint                               = "${var.enable_ecs_endpoint}"
  ecs_endpoint_security_group_ids                   = "${var.ecs_endpoint_security_group_ids}"
  ecs_endpoint_subnet_ids                           = "${var.ecs_endpoint_subnet_ids}"
  ecs_endpoint_private_dns_enabled                  = "${var.ecs_endpoint_private_dns_enabled}"
  enable_ecs_agent_endpoint                         = "${var.enable_ecs_agent_endpoint}"
  ecs_agent_endpoint_security_group_ids             = "${var.ecs_agent_endpoint_security_group_ids}"
  ecs_agent_endpoint_subnet_ids                     = "${var.ecs_agent_endpoint_subnet_ids}"
  ecs_agent_endpoint_private_dns_enabled            = "${var.ecs_agent_endpoint_private_dns_enabled}"
  enable_ecs_telemetry_endpoint                     = "${var.enable_ecs_telemetry_endpoint}"
  ecs_telemetry_endpoint_security_group_ids         = "${var.ecs_telemetry_endpoint_security_group_ids}"
  ecs_telemetry_endpoint_subnet_ids                 = "${var.ecs_telemetry_endpoint_subnet_ids}"
  ecs_telemetry_endpoint_private_dns_enabled        = "${var.ecs_telemetry_endpoint_private_dns_enabled}"
  enable_sns_endpoint                               = "${var.enable_sns_endpoint}"
  sns_endpoint_security_group_ids                   = "${var.sns_endpoint_security_group_ids}"
  sns_endpoint_subnet_ids                           = "${var.sns_endpoint_subnet_ids}"
  sns_endpoint_private_dns_enabled                  = "${var.sns_endpoint_private_dns_enabled}"
  enable_monitoring_endpoint                        = "${var.enable_monitoring_endpoint}"
  monitoring_endpoint_security_group_ids            = "${var.monitoring_endpoint_security_group_ids}"
  monitoring_endpoint_subnet_ids                    = "${var.monitoring_endpoint_subnet_ids}"
  monitoring_endpoint_private_dns_enabled           = "${var.monitoring_endpoint_private_dns_enabled}"
  enable_elasticloadbalancing_endpoint              = "${var.enable_elasticloadbalancing_endpoint}"
  elasticloadbalancing_endpoint_security_group_ids  = "${var.elasticloadbalancing_endpoint_security_group_ids}"
  elasticloadbalancing_endpoint_subnet_ids          = "${var.elasticloadbalancing_endpoint_subnet_ids}"
  elasticloadbalancing_endpoint_private_dns_enabled = "${var.elasticloadbalancing_endpoint_private_dns_enabled}"
  enable_events_endpoint                            = "${var.enable_events_endpoint}"
  events_endpoint_security_group_ids                = "${var.events_endpoint_security_group_ids}"
  events_endpoint_subnet_ids                        = "${var.events_endpoint_subnet_ids}"
  events_endpoint_private_dns_enabled               = "${var.events_endpoint_private_dns_enabled}"
  enable_logs_endpoint                              = "${var.enable_logs_endpoint}"
  logs_endpoint_security_group_ids                  = "${var.logs_endpoint_security_group_ids}"
  logs_endpoint_subnet_ids                          = "${var.logs_endpoint_subnet_ids}"
  logs_endpoint_private_dns_enabled                 = "${var.logs_endpoint_private_dns_enabled}"
  enable_cloudtrail_endpoint                        = "${var.enable_cloudtrail_endpoint}"
  cloudtrail_endpoint_security_group_ids            = "${var.cloudtrail_endpoint_security_group_ids}"
  cloudtrail_endpoint_subnet_ids                    = "${var.cloudtrail_endpoint_subnet_ids}"
  cloudtrail_endpoint_private_dns_enabled           = "${var.cloudtrail_endpoint_private_dns_enabled}"
  map_public_ip_on_launch                           = "${var.map_public_ip_on_launch}"
  enable_vpn_gateway                                = "${var.enable_vpn_gateway}"
  vpn_gateway_id                                    = "${var.vpn_gateway_id}"
  amazon_side_asn                                   = "${var.amazon_side_asn}"
  propagate_private_route_tables_vgw                = "${var.propagate_private_route_tables_vgw}"
  propagate_public_route_tables_vgw                 = "${var.propagate_public_route_tables_vgw}"
  tags                                              = "${var.tags}"
  database_route_table_tags                         = "${var.database_route_table_tags}"
  redshift_route_table_tags                         = "${var.redshift_route_table_tags}"
  elasticache_route_table_tags                      = "${var.elasticache_route_table_tags}"
  intra_route_table_tags                            = "${var.intra_route_table_tags}"
  database_subnet_tags                              = "${var.database_subnet_tags}"
  database_subnet_group_tags                        = "${var.database_subnet_group_tags}"
  redshift_subnet_tags                              = "${var.redshift_subnet_tags}"
  redshift_subnet_group_tags                        = "${var.redshift_subnet_group_tags}"
  elasticache_subnet_tags                           = "${var.elasticache_subnet_tags}"
  intra_subnet_tags                                 = "${var.intra_subnet_tags}"
  public_acl_tags                                   = "${var.public_acl_tags}"
  private_acl_tags                                  = "${var.private_acl_tags}"
  intra_acl_tags                                    = "${var.intra_acl_tags}"
  database_acl_tags                                 = "${var.database_acl_tags}"
  redshift_acl_tags                                 = "${var.redshift_acl_tags}"
  elasticache_acl_tags                              = "${var.elasticache_acl_tags}"
  dhcp_options_tags                                 = "${var.dhcp_options_tags}"
  nat_gateway_tags                                  = "${var.nat_gateway_tags}"
  nat_eip_tags                                      = "${var.nat_eip_tags}"
  vpc_tags                                          = "${var.vpc_tags}"
  vpn_gateway_tags                                  = "${var.vpn_gateway_tags}"
  enable_dhcp_options                               = "${var.enable_dhcp_options}"
  dhcp_options_domain_name                          = "${var.dhcp_options_domain_name}"
  dhcp_options_domain_name_servers                  = "${var.dhcp_options_domain_name_servers}"
  dhcp_options_ntp_servers                          = "${var.dhcp_options_ntp_servers}"
  dhcp_options_netbios_name_servers                 = "${var.dhcp_options_netbios_name_servers}"
  dhcp_options_netbios_node_type                    = "${var.dhcp_options_netbios_node_type}"
  manage_default_vpc                                = "${var.manage_default_vpc}"
  default_vpc_name                                  = "${var.default_vpc_name}"
  default_vpc_enable_dns_support                    = "${var.default_vpc_enable_dns_support}"
  default_vpc_enable_dns_hostnames                  = "${var.default_vpc_enable_dns_hostnames}"
  default_vpc_enable_classiclink                    = "${var.default_vpc_enable_classiclink}"
  default_vpc_tags                                  = "${var.default_vpc_tags}"
  manage_default_network_acl                        = "${var.manage_default_network_acl}"
  default_network_acl_name                          = "${var.default_network_acl_name}"
  default_network_acl_tags                          = "${var.default_network_acl_tags}"
  public_dedicated_network_acl                      = "${var.public_dedicated_network_acl}"
  private_dedicated_network_acl                     = "${var.private_dedicated_network_acl}"
  intra_dedicated_network_acl                       = "${var.intra_dedicated_network_acl}"
  database_dedicated_network_acl                    = "${var.database_dedicated_network_acl}"
  redshift_dedicated_network_acl                    = "${var.redshift_dedicated_network_acl}"
  elasticache_dedicated_network_acl                 = "${var.elasticache_dedicated_network_acl}"
  default_network_acl_ingress                       = "${var.default_network_acl_ingress}"
  default_network_acl_egress                        = "${var.default_network_acl_egress}"
  public_inbound_acl_rules                          = "${var.public_inbound_acl_rules}"
  public_outbound_acl_rules                         = "${var.public_outbound_acl_rules}"
  private_inbound_acl_rules                         = "${var.private_inbound_acl_rules}"
  private_outbound_acl_rules                        = "${var.private_outbound_acl_rules}"
  intra_inbound_acl_rules                           = "${var.intra_inbound_acl_rules}"
  intra_outbound_acl_rules                          = "${var.intra_outbound_acl_rules}"
  database_inbound_acl_rules                        = "${var.database_inbound_acl_rules}"
  database_outbound_acl_rules                       = "${var.database_outbound_acl_rules}"
  redshift_inbound_acl_rules                        = "${var.redshift_inbound_acl_rules}"
  redshift_outbound_acl_rules                       = "${var.redshift_outbound_acl_rules}"
  elasticache_inbound_acl_rules                     = "${var.elasticache_inbound_acl_rules}"
  elasticache_outbound_acl_rules                    = "${var.elasticache_outbound_acl_rules}"
}


resource "aws_cloudwatch_log_group" "this_cloud_watch" {
  name              = local.log_group_name
  retention_in_days = var.log_retention_in_days

  tags = var.tags
}

resource "aws_iam_role" "vpc_flow_log_role" {
  name = local.flow_log_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "vpc_flow_log_policy" {
  name = "example"
  role = aws_iam_role.vpc_flow_log_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.vpc_flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.this_cloud_watch.arn
  traffic_type    = "ALL"
  vpc_id          = module.this_vpc.vpc_id
}
