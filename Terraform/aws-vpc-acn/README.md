# AWS VPC Terraform module (Accenture Specific)
This module inherits all the properties of the open source [AWS EC2 Instance Terraform module](https://innersource.accenture.com/projects/TFML/repos/terraform-aws-ec2-instance/browse) and adds some features specific to Accenture environments in order to comply with Accenture Cloud Platform (ACP) compliance policies. These features include:

* **VPC Flow Logs** ([#75 VPC Flow Logs](https://ts.accenture.com/sites/ACP_Security_Compliance/Shared%20Documents/Amazon/075%20VPC%20Flow%20Logs.pdf)):  This module will automatically create a CloudWatch log group and flow log resource attached to the VPC. Currently the module only supports logging to CloudWatch (i.e. no option for S3). There is one variable associated with this feature:
    * log_retention_in_days (int): The number of days you would like the CloudWatch log group to retain the logs for this VPC. Default=14

* **Resource Tagging for Publicly Accessible Subnets** ([#59 Public Subnets](https://ts.accenture.com/sites/ACP_Security_Compliance/Shared%20Documents/Amazon/059_Public_Subnets.pdf)):  Adds a tag of 'Accessibility=Public' to public subnets and public route tables. This is automatic and has no variables for configuration.

* **Resource Tagging for Subnets**:  Allows for specifying public, private, and all subnet tags to be applied within the VPC.

* **Resource Naming**:  Automatically naming of VPC, Internet Gateway, Public/Private Subnets, Public/Private Route Tables, CloudWatch Log Group, and Flow Log based on the environment name provided. This feature removes the ability to specify your own values for these resource types.
    * environment_name (string):  The root name of the environment being created

## NOTES:
* This module will not auto-update as updates are made to the core open-source module. The module is currently linked to version 2.7.0 of the open source module. Any future version will need to be evaluated to see impact to this module.
* This module meets current ACP compliance requirements on 2019-06-30. Continued compliance will need to be monitored and updates to this module maintained.
* All contributions are welcome to this module

Hope you avoid SOC non-compliance emails... happy clouding!