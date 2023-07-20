# Bastion AWS Module

This repository contains a Module for deploying auto-scaling bastion hosts on [AWS](https://aws.amazon.com/) 
using [Terraform](https://www.terraform.io/). A bastion is a common technique to provide an environment support ingress to a public cloud hosted environment.

Figure 1: Linux bastion host architecture on AWS
![alt text](https://docs.aws.amazon.com/quickstart/latest/linux-bastion/images/linux-bastion-hosts-on-aws-architecture.png "Figure 1: Linux bastion host architecture on AWS")

## Example Usage
```json
data "aws_availability_zones" "available" {
  state = "available"
}

module "example_vpc" {

  source = "git::ssh://git@innersource.accenture.com/tfml/terraform-aws-vpc-acn.git?ref=v2.7.0"

  environment_name = "PROJECT-DEV"
  cidr             = "172.16.0.0/24"

  public_subnets     = ["172.16.0.0/26","172.16.0.64/26"]
  private_subnets    = ["172.16.0.128/26","172.16.0.192/26"]
  azs                = "${data.aws_availability_zones.available.names}"

  log_retention_in_days = "14"

  tags = {
    "Environment" = "DEV" 
    "Project" = "PROJECT"
  }
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqGKukO1De7zhZj6+H0qtjTkVxwTCpvKe4eCZ0FPqri0cb2JZfXJ/DgYSF6vUpwmJG8wVQZKjeGcjDOL5UlsuusFncCzWBQ7RKNUSesmQRMSGkVb1/3j+skZ6UtW+5u09lHNsj6tQ51s1SPrCBkedbNf0Tp0GbMJDyR4e9T04ZZwIDAQAB"
}

module "bastion" {

  source = "git::ssh://git@innersource.accenture.com/tfml/terraform-aws-bastion.git?ref=v0.3"

  name                        = "PROEJCT-DEV-BASTION"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.bastion.key_name}"
  vpc_id                      = "${module.example_vpc.vpc_id}"
  public_subnet_ids           = "${module.example_vpc.public_subnets}"
  associate_public_ip_address = true
  allowed_cidr = [
    // Accenture IP Range
    "170.248.48.0/20",
    "170.248.136.0/23",
    "170.248.128.0/21",
    "170.248.64.0/18"
  ]

  cloudinit_userdata          = file("./cloud_init.yml") # OPTIONAL - only define this if there needs to be a custom cloud_init script - leave out the entire line otherwise
  
  extra_tags = {
    "Environment" = "DEV" 
    "Project" = "PROJECT"
  }
}
```
