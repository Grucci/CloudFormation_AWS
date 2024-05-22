terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {

  }
}
####
# data "azurerm_subscription" "subscription"{
#   subscription_id = "27ef1f07-ab2f-47f7-b7f4-df091235184b"
# }

# data "azurerm_policy_definition" "logicappdenyha" {
#   display_name = "Test Deny Deployment of Logic Apps Without High Availability"

#   depends_on = [ azurerm_policy_definition.logicappdenyha ]
# }

# data "azurerm_policy_definition" "logicappauditha" {
#   display_name = "Test AUDIT Deployment of Logic Apps Without High Availability"

#   depends_on = [ azurerm_policy_definition.logicappdenyha ]
# }

// Get the list of Policies
data "azurerm_policy_definition" "custom_policies_definitions" {
  count        = length(var.policies_definitions_list)
  display_name = var.policies_definitions_list[count.index]

  depends_on = [
    azurerm_policy_definition.logicappdenyha
  ]
}

## Policy Definition
resource "azurerm_policy_definition" "logicappdenyha" {
  name         = var.policy_name
  display_name = var.policy_display_name
  description  = var.policy_description
  mode         = var.policy_mode
  policy_type  = var.policy_type

  lifecycle {
    ignore_changes = [metadata]
}
  metadata = file("${path.module}/LogicAppDenyHA/metadata.json")
  policy_rule = file("${path.module}/LogicAppDenyHA/policyRule.json")
  parameters = file("${path.module}/LogicAppDenyHA/parameters.json")
}


resource "azurerm_policy_definition" "logicappauditha" {
  name         = var.policy_namev2
  display_name = var.policy_display_namev2
  description  = var.policy_descriptionv2
  mode         = var.policy_modev2
  policy_type  = var.policy_typev2

  lifecycle {
    ignore_changes = [metadata]
}
  metadata = file("${path.module}/LogicAppAuditHA/metadata.json")
  policy_rule = file("${path.module}/LogicAppAuditHA/policyRule.json")
  parameters = file("${path.module}/LogicAppAuditHA/parameters.json")
}

resource "azurerm_policy_set_definition" "logicappdenyha_polset" {
  name         = "[WAF] Test Initiative"
  policy_type  = "Custom"
  display_name = "[WAF] Test Initiative"
  description  = "[WAF] Test Initiative"
#   metadata = <<METADATA
#     {
#     "category": "${var.policyset_definition_category}"
#     }
# METADATA

  dynamic "policy_definition_reference" {
    for_each = data.azurerm_policy_definition.custom_policies_definitions
    content {
      policy_definition_id = policy_definition_reference.logicappdenyha.id
      reference_id         = policy_definition_reference.value["id"]
      # parameters           = var.custom_initiative_parameters["id"]
    }
  }

  depends_on = [
    data.azurerm_policy_definition.custom_policies_definitions
  ]

  # dynamic "policy_definition_reference" {
  #   for_each = var.policy_list ? [1] : []
  #   content {
  #     policy_definition_id = policy_list.id
  #   }
    
  # }

  # policy_definition_reference {
  #   policy_definition_id = data.azurerm_policy_definition.policy_deny_def_id.id
  # }

  #   policy_definition_reference {
  #   policy_definition_id = data.azurerm_policy_definition.policy_audit_def_id.id
  # }

}

# ### Policy Assignment
# resource "azurerm_subscription_policy_assignment" "logicappdenyha_assignment" {
#   name = "[WAF] Test Initiative"
#   subscription_id = data.azurerm_subscription.subscription.id
#   policy_definition_id = azurerm_policy_definition.logicappdenyha.id
#   display_name = "[WAF] Test Initiative"
# }