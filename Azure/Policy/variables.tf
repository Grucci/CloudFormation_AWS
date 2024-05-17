variable "policy_name"{
    description = "Policy Name"
    type        = string
    default     = ""
}

variable "policy_display_name"{
    description = "The display name identifies the policy definition"
    type        = string
    default     = ""
}

variable "policy_description"{
    description = "The description provides context for when the definition is used"
    type        = string
    default     = ""
}

variable "policy_mode"{
    description = "The mode determines which resource types are evaluated for a policy definition. Supported values: All, Indexed."
    type        = string
    default     = ""
}

variable "policy_type"{
    description = "The policy type determines the nature and purpose of the policy definition"
    type        = string
    default     = ""
}