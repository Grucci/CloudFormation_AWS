#################
# Custom Outputs
#################
output "flow_log_id" {
  description = "The ID of the flow log for the VPC"
  value = "${aws_flow_log.vpc_flow_log.id}"
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch log group"
  value = "${aws_cloudwatch_log_group.this_cloud_watch.arn}"
}

###########################
# Pass-Through Outputs 
###########################
output "vpc_id" {
  description = "The ID of the VPC"
  value = "${module.this_vpc.vpc_id}"
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value = "${module.this_vpc.vpc_arn}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = "${module.this_vpc.vpc_cidr_block}"
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value = "${module.this_vpc.default_security_group_id}"
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value = "${module.this_vpc.default_network_acl_id}"
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value = "${module.this_vpc.default_route_table_id}"
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value = "${module.this_vpc.vpc_instance_tenancy}"
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value = "${module.this_vpc.vpc_enable_dns_support}"
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value = "${module.this_vpc.vpc_enable_dns_hostnames}"
}

//output "vpc_enable_classiclink" {
//  description = "Whether or not the VPC has Classiclink enabled"
//  value       = "${element(concat(aws_vpc.this.*.enable_classiclink, list("")), 0)}"
//}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value = "${module.this_vpc.vpc_main_route_table_id}"
}

//output "vpc_ipv6_association_id" {
//  description = "The association ID for the IPv6 CIDR block"
//  value       = "${element(concat(aws_vpc.this.*.ipv6_association_id, list("")), 0)}"
//}
//
//output "vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = "${element(concat(aws_vpc.this.*.ipv6_cidr_block, list("")), 0)}"
//}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value = "${module.this_vpc.vpc_secondary_cidr_blocks}"
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value = "${module.this_vpc.private_subnets}"
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value = "${module.this_vpc.private_subnet_arns}"
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value = "${module.this_vpc.private_subnets_cidr_blocks}"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value = "${module.this_vpc.public_subnets}"
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value = "${module.this_vpc.public_subnet_arns}"
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value = "${module.this_vpc.public_subnets_cidr_blocks}"
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value = "${module.this_vpc.database_subnets}"
}

output "database_subnet_arns" {
  description = "List of ARNs of database subnets"
  value = "${module.this_vpc.database_subnet_arns}"
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value = "${module.this_vpc.database_subnets_cidr_blocks}"
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value = "${module.this_vpc.database_subnet_group}"
}

output "redshift_subnets" {
  description = "List of IDs of redshift subnets"
  value = "${module.this_vpc.redshift_subnets}"
}

output "redshift_subnet_arns" {
  description = "List of ARNs of redshift subnets"
  value = "${module.this_vpc.redshift_subnet_arns}"
}

output "redshift_subnets_cidr_blocks" {
  description = "List of cidr_blocks of redshift subnets"
  value = "${module.this_vpc.redshift_subnets_cidr_blocks}"
}

output "redshift_subnet_group" {
  description = "ID of redshift subnet group"
  value = "${module.this_vpc.redshift_subnet_group}"
}

output "elasticache_subnets" {
  description = "List of IDs of elasticache subnets"
  value = "${module.this_vpc.elasticache_subnets}"
}

output "elasticache_subnet_arns" {
  description = "List of ARNs of elasticache subnets"
  value = "${module.this_vpc.elasticache_subnet_arns}"
}

output "elasticache_subnets_cidr_blocks" {
  description = "List of cidr_blocks of elasticache subnets"
  value = "${module.this_vpc.elasticache_subnets_cidr_blocks}"
}

output "intra_subnets" {
  description = "List of IDs of intra subnets"
  value = "${module.this_vpc.intra_subnets}"
}

output "intra_subnet_arns" {
  description = "List of ARNs of intra subnets"
  value = "${module.this_vpc.intra_subnet_arns}"
}

output "intra_subnets_cidr_blocks" {
  description = "List of cidr_blocks of intra subnets"
  value = "${module.this_vpc.intra_subnets_cidr_blocks}"
}

output "elasticache_subnet_group" {
  description = "ID of elasticache subnet group"
  value = "${module.this_vpc.elasticache_subnet_group}"
}

output "elasticache_subnet_group_name" {
  description = "Name of elasticache subnet group"
  value = "${module.this_vpc.elasticache_subnet_group_name}"
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value = "${module.this_vpc.public_route_table_ids}"
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value = "${module.this_vpc.private_route_table_ids}"
}

output "database_route_table_ids" {
  description = "List of IDs of database route tables"
  value = "${module.this_vpc.database_route_table_ids}"
}

output "redshift_route_table_ids" {
  description = "List of IDs of redshift route tables"
  value = "${module.this_vpc.redshift_route_table_ids}"
}

output "elasticache_route_table_ids" {
  description = "List of IDs of elasticache route tables"
  value = "${module.this_vpc.elasticache_route_table_ids}"
}

output "intra_route_table_ids" {
  description = "List of IDs of intra route tables"
  value = "${module.this_vpc.intra_route_table_ids}"
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value = "${module.this_vpc.nat_ids}"
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value = "${module.this_vpc.nat_public_ips}"
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value = "${module.this_vpc.natgw_ids}"
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value = "${module.this_vpc.igw_id}"
}

output "vgw_id" {
  description = "The ID of the VPN Gateway"
  value = "${module.this_vpc.vgw_id}"
}

output "default_vpc_id" {
  description = "The ID of the VPC"
  value = "${module.this_vpc.default_vpc_id}"
}

output "default_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = "${module.this_vpc.default_vpc_cidr_block}"
}

output "default_vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value = "${module.this_vpc.default_vpc_default_security_group_id}"
}

output "default_vpc_default_network_acl_id" {
  description = "The ID of the default network ACL"
  value = "${module.this_vpc.default_vpc_default_network_acl_id}"
}

output "default_vpc_default_route_table_id" {
  description = "The ID of the default route table"
  value = "${module.this_vpc.default_vpc_default_route_table_id}"
}

output "default_vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value = "${module.this_vpc.default_vpc_instance_tenancy}"
}

output "default_vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value = "${module.this_vpc.default_vpc_enable_dns_support}"
}

output "default_vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value = "${module.this_vpc.default_vpc_enable_dns_hostnames}"
}

//output "default_vpc_enable_classiclink" {
//  description = "Whether or not the VPC has Classiclink enabled"
//  value       = "${element(concat(aws_default_vpc.this.*.enable_classiclink, list("")), 0)}"
//}

output "default_vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value = "${module.this_vpc.default_vpc_main_route_table_id}"
}

//output "default_vpc_ipv6_association_id" {
//  description = "The association ID for the IPv6 CIDR block"
//  value       = "${element(concat(aws_default_vpc.this.*.ipv6_association_id, list("")), 0)}"
//}
//
//output "default_vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = "${element(concat(aws_default_vpc.this.*.ipv6_cidr_block, list("")), 0)}"
//}

output "public_network_acl_id" {
  description = "ID of the public network ACL"
  value = "${module.this_vpc.public_network_acl_id}"
}

output "private_network_acl_id" {
  description = "ID of the private network ACL"
  value = "${module.this_vpc.private_network_acl_id}"
}

output "intra_network_acl_id" {
  description = "ID of the intra network ACL"
  value = "${module.this_vpc.intra_network_acl_id}"
}

output "database_network_acl_id" {
  description = "ID of the database network ACL"
  value = "${module.this_vpc.database_network_acl_id}"
}

output "redshift_network_acl_id" {
  description = "ID of the redshift network ACL"
  value = "${module.this_vpc.redshift_network_acl_id}"
}

output "elasticache_network_acl_id" {
  description = "ID of the elasticache network ACL"
  value = "${module.this_vpc.elasticache_network_acl_id}"
}

# VPC Endpoints
output "vpc_endpoint_s3_id" {
  description = "The ID of VPC endpoint for S3"
  value = "${module.this_vpc.vpc_endpoint_s3_id}"
}

output "vpc_endpoint_s3_pl_id" {
  description = "The prefix list for the S3 VPC endpoint."
  value = "${module.this_vpc.vpc_endpoint_s3_pl_id}"
}

output "vpc_endpoint_dynamodb_id" {
  description = "The ID of VPC endpoint for DynamoDB"
  value = "${module.this_vpc.vpc_endpoint_dynamodb_id}"
}

output "vpc_endpoint_dynamodb_pl_id" {
  description = "The prefix list for the DynamoDB VPC endpoint."
  value = "${module.this_vpc.vpc_endpoint_dynamodb_pl_id}"
}

output "vpc_endpoint_sqs_id" {
  description = "The ID of VPC endpoint for SQS"
  value = "${module.this_vpc.vpc_endpoint_sqs_id}"
}

output "vpc_endpoint_sqs_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for SQS."
  value = "${module.this_vpc.vpc_endpoint_sqs_network_interface_ids}"
}

output "vpc_endpoint_sqs_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for SQS."
  value = "${module.this_vpc.vpc_endpoint_sqs_dns_entry}"
}

output "vpc_endpoint_ssm_id" {
  description = "The ID of VPC endpoint for SSM"
  value = "${module.this_vpc.vpc_endpoint_ssm_id}"
}

output "vpc_endpoint_ssm_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for SSM."
  value = "${module.this_vpc.vpc_endpoint_ssm_network_interface_ids}"
}

output "vpc_endpoint_ssm_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for SSM."
  value = "${module.this_vpc.vpc_endpoint_ssm_dns_entry}"
}

output "vpc_endpoint_ssmmessages_id" {
  description = "The ID of VPC endpoint for SSMMESSAGES"
  value = "${module.this_vpc.vpc_endpoint_ssmmessages_id}"
}

output "vpc_endpoint_ssmmessages_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for SSMMESSAGES."
  value = "${module.this_vpc.vpc_endpoint_ssmmessages_network_interface_ids}"
}

output "vpc_endpoint_ssmmessages_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for SSMMESSAGES."
  value = "${module.this_vpc.vpc_endpoint_ssmmessages_dns_entry}"
}

output "vpc_endpoint_ec2_id" {
  description = "The ID of VPC endpoint for EC2"
  value = "${module.this_vpc.vpc_endpoint_ec2_id}"
}

output "vpc_endpoint_ec2_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for EC2"
  value = "${module.this_vpc.vpc_endpoint_ec2_network_interface_ids}"
}

output "vpc_endpoint_ec2_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for EC2."
  value = "${module.this_vpc.vpc_endpoint_ec2_dns_entry}"
}

output "vpc_endpoint_ec2messages_id" {
  description = "The ID of VPC endpoint for EC2MESSAGES"
  value = "${module.this_vpc.vpc_endpoint_ec2messages_id}"
}

output "vpc_endpoint_ec2messages_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for EC2MESSAGES"
  value = "${module.this_vpc.vpc_endpoint_ec2messages_network_interface_ids}"
}

output "vpc_endpoint_ec2messages_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for EC2MESSAGES."
  value = "${module.this_vpc.vpc_endpoint_ec2messages_dns_entry}"
}

output "vpc_endpoint_kms_id" {
  description = "The ID of VPC endpoint for KMS"
  value = "${module.this_vpc.vpc_endpoint_kms_id}"
}

output "vpc_endpoint_kms_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for KMS."
  value = "${module.this_vpc.vpc_endpoint_kms_network_interface_ids}"
}

output "vpc_endpoint_kms_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for KMS."
  value = "${module.this_vpc.vpc_endpoint_kms_dns_entry}"
}

output "vpc_endpoint_ecr_api_id" {
  description = "The ID of VPC endpoint for ECR API"
  value = "${module.this_vpc.vpc_endpoint_ecr_api_id}"
}

output "vpc_endpoint_ecr_api_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for ECR API."
  value = "${module.this_vpc.vpc_endpoint_ecr_api_network_interface_ids}"
}

output "vpc_endpoint_ecr_api_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for ECR API."
  value = "${module.this_vpc.vpc_endpoint_ecr_api_dns_entry}"
}

output "vpc_endpoint_ecr_dkr_id" {
  description = "The ID of VPC endpoint for ECR DKR"
  value = "${module.this_vpc.vpc_endpoint_ecr_dkr_id}"
}

output "vpc_endpoint_ecr_dkr_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for ECR DKR."
  value = "${module.this_vpc.vpc_endpoint_ecr_dkr_network_interface_ids}"
}

output "vpc_endpoint_ecr_dkr_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for ECR DKR."
  value = "${module.this_vpc.vpc_endpoint_ecr_dkr_dns_entry}"
}

output "vpc_endpoint_apigw_id" {
  description = "The ID of VPC endpoint for APIGW"
  value = "${module.this_vpc.vpc_endpoint_apigw_id}"
}

output "vpc_endpoint_apigw_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for APIGW."
  value = "${module.this_vpc.vpc_endpoint_apigw_network_interface_ids}"
}

output "vpc_endpoint_apigw_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for APIGW."
  value = "${module.this_vpc.vpc_endpoint_apigw_dns_entry}"
}

output "vpc_endpoint_ecs_id" {
  description = "The ID of VPC endpoint for ECS"
  value = "${module.this_vpc.vpc_endpoint_ecs_id}"
}

output "vpc_endpoint_ecs_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for ECS."
  value = "${module.this_vpc.vpc_endpoint_ecs_network_interface_ids}"
}

output "vpc_endpoint_ecs_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for ECS."
  value = "${module.this_vpc.vpc_endpoint_ecs_dns_entry}"
}

output "vpc_endpoint_ecs_agent_id" {
  description = "The ID of VPC endpoint for ECS Agent"
  value = "${module.this_vpc.vpc_endpoint_ecs_agent_id}"
}

output "vpc_endpoint_ecs_agent_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for ECS Agent."
  value = "${module.this_vpc.vpc_endpoint_ecs_agent_network_interface_ids}"
}

output "vpc_endpoint_ecs_agent_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for ECS Agent."
  value = "${module.this_vpc.vpc_endpoint_ecs_agent_dns_entry}"
}

output "vpc_endpoint_ecs_telemetry_id" {
  description = "The ID of VPC endpoint for ECS Telemetry"
  value = "${module.this_vpc.vpc_endpoint_ecs_telemetry_id}"
}

output "vpc_endpoint_ecs_telemetry_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for ECS Telemetry."
  value = "${module.this_vpc.vpc_endpoint_ecs_telemetry_network_interface_ids}"
}

output "vpc_endpoint_ecs_telemetry_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for ECS Telemetry."
  value = "${module.this_vpc.vpc_endpoint_ecs_telemetry_dns_entry}"
}

output "vpc_endpoint_sns_id" {
  description = "The ID of VPC endpoint for SNS"
  value = "${module.this_vpc.vpc_endpoint_sns_id}"
}

output "vpc_endpoint_sns_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for SNS."
  value = "${module.this_vpc.vpc_endpoint_sns_network_interface_ids}"
}

output "vpc_endpoint_sns_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for SNS."
  value = "${module.this_vpc.vpc_endpoint_sns_dns_entry}"
}

output "vpc_endpoint_monitoring_id" {
  description = "The ID of VPC endpoint for CloudWatch Monitoring"
  value = "${module.this_vpc.vpc_endpoint_monitoring_id}"
}

output "vpc_endpoint_monitoring_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for CloudWatch Monitoring."
  value = "${module.this_vpc.vpc_endpoint_monitoring_network_interface_ids}"
}

output "vpc_endpoint_monitoring_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for CloudWatch Monitoring."
  value = "${module.this_vpc.vpc_endpoint_monitoring_dns_entry}"
}

output "vpc_endpoint_logs_id" {
  description = "The ID of VPC endpoint for CloudWatch Logs"
  value = "${module.this_vpc.vpc_endpoint_logs_id}"
}

output "vpc_endpoint_logs_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for CloudWatch Logs."
  value = "${module.this_vpc.vpc_endpoint_logs_network_interface_ids}"
}

output "vpc_endpoint_logs_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for CloudWatch Logs."
  value = "${module.this_vpc.vpc_endpoint_logs_dns_entry}"
}

output "vpc_endpoint_events_id" {
  description = "The ID of VPC endpoint for CloudWatch Events"
  value = "${module.this_vpc.vpc_endpoint_events_id}"
}

output "vpc_endpoint_events_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for CloudWatch Events."
  value = "${module.this_vpc.vpc_endpoint_events_network_interface_ids}"
}

output "vpc_endpoint_events_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for CloudWatch Events."
  value = "${module.this_vpc.vpc_endpoint_events_dns_entry}"
}

output "vpc_endpoint_elasticloadbalancing_id" {
  description = "The ID of VPC endpoint for Elastic Load Balancing"
  value = "${module.this_vpc.vpc_endpoint_elasticloadbalancing_id}"
}

output "vpc_endpoint_elasticloadbalancing_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for Elastic Load Balancing."
  value = "${module.this_vpc.vpc_endpoint_elasticloadbalancing_network_interface_ids}"
}

output "vpc_endpoint_elasticloadbalancing_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for Elastic Load Balancing."
  value = "${module.this_vpc.vpc_endpoint_elasticloadbalancing_dns_entry}"
}

output "vpc_endpoint_cloudtrail_id" {
  description = "The ID of VPC endpoint for CloudTrail"
  value = "${module.this_vpc.vpc_endpoint_cloudtrail_id}"
}

output "vpc_endpoint_cloudtrail_network_interface_ids" {
  description = "One or more network interfaces for the VPC Endpoint for CloudTrail."
  value = "${module.this_vpc.vpc_endpoint_cloudtrail_network_interface_ids}"
}

output "vpc_endpoint_cloudtrail_dns_entry" {
  description = "The DNS entries for the VPC Endpoint for CloudTrail."
  value = "${module.this_vpc.vpc_endpoint_cloudtrail_dns_entry}"
}

# Static values (arguments)
output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value = "${module.this_vpc.azs}"
}

