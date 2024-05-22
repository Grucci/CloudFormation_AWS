// Policy Category
# variable "policy_definition_category" {
#     type        = string
#     description = "The category to use for all PolicySet defintions"
# }   


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

variable "policy_namev2"{
    description = "Policy Name"
    type        = string
    default     = ""
}

variable "policy_display_namev2"{
    description = "The display name identifies the policy definition"
    type        = string
    default     = ""
}

variable "policy_descriptionv2"{
    description = "The description provides context for when the definition is used"
    type        = string
    default     = ""
}

variable "policy_modev2"{
    description = "The mode determines which resource types are evaluated for a policy definition. Supported values: All, Indexed."
    type        = string
    default     = ""
}

variable "policy_typev2"{
    description = "The policy type determines the nature and purpose of the policy definition"
    type        = string
    default     = ""
}

variable "policy_namev3"{
    description = "Policy Name"
    type        = string
    default     = ""
}

variable "policy_display_namev3"{
    description = "The display name identifies the policy definition"
    type        = string
    default     = ""
}

variable "policy_descriptionv3"{
    description = "The description provides context for when the definition is used"
    type        = string
    default     = ""
}

variable "policy_modev3"{
    description = "The mode determines which resource types are evaluated for a policy definition. Supported values: All, Indexed."
    type        = string
    default     = ""
}

variable "policy_typev3"{
    description = "The policy type determines the nature and purpose of the policy definition"
    type        = string
    default     = ""
}

## List of Policy Definitions for the Custom Initiative
variable "policies_definitions_list"{
    description = "List of policy definitions"
    type = list
    default = [
        "Deny Logic Apps Without High Availability", "Audit Logic Apps Without High Availability", "Disable Logic Apps Without High Availability"
    ]
}

# variable "custom_policy_definition"{
#     description = "The policy type determines the nature and purpose of the policy definition"
#     type = list(string)
#     default = ["azurerm_policy_definition.policy_deny_def_id.id", "azurerm_policy_definition.policy_audit_def_id.id"]
# }   

// Define parameters for the Custom Initiative
# variable "custom_initiative_parameters" {
#     type        = list
#     description = "List of policy definitions"
#     default = [
#         <<PARAMETERS
#         {
#         "principalType": {
#             "value": "User"
#         }
#         }
#         PARAMETERS,
#         <<PARAMETERS
#         {
#         "paramfornextpolicy": {
#             "value": "valuefornextpolicy"
#         }
#         }
#         PARAMETERS    
#     ]
# }

# // Initiative Category
# variable "policyset_definition_category" {
#     type        = string
#     description = "The category to use for all PolicySet defintions"
#     default     = "Custom"
# }