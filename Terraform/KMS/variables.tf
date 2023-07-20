variable "key_name" {
  type    = string
  default = "name"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enable"
  type        = bool
  default     = true
}

variable "policy" {
  description = "A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constanty changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy"
  type        = string
  default     = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "kms_type" {
  type    = string
  default = "internal"
}