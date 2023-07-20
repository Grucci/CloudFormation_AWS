variable "allowed_cidr" {
  type = list

  default = [
    "0.0.0.0/0",
  ]

  description = "A list of CIDR Networks to allow ssh access to."
}

variable "allowed_security_groups" {
  type        = list
  default     = []
  description = "(Optional) A list of Security Group ID's that will have TCP22 (SSH) added to their ingress rules"
}

variable "name" {
  default = "BASTION"
}

variable extra_tags {
  type = map
  default = {
    created_by      = "Terraform"
    orchestrated_by = "Ansible"
  }
  description = "(Optional) A map of tags to associate to the bastion instance."
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_ami" {
  description = "(Optional) The AMI to be used for the bastion instance. If not specified, Ubuntu 16.4 will be used"
  default     = ""
}

variable "instance_volume_size_gb" {
  description = "The root volume size, in gigabytes"
  default     = "32"
}

variable "enable_monitoring" {
  description = "Enables monitoring of the auto-scaling group"
  default     = true
}


variable "vpc_id" {}

variable "security_group_ids" {
  description = "(Optional) A list of additional security groups to apply to the bastion."
  default     = []
}

variable "public_subnet_ids" {
  description = "A list of public subnet ids to deploy the bastion loadbalancer within"
}

variable "associate_public_ip_address" {
  default = true
}

variable "key_name" {
  description = "The EC2 public key name used to provision the bastion instances"
}

variable "additional_user_data_script" {
  default = ""
}

variable "cloudinit_userdata" {
  default = null #this is a special type. Terraform will treat as ommitted unless defined.
}
