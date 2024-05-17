terraform {
  required_version = ">=0.13"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_policy_definition" "logicappdenyha" {
  name         = var.policy_name
  display_name = var.policy_display_name
  description  = var.policy_description
  mode         = var.policy_mode
  policy_type  = var.policy_type

  lifecycle {
    ignore_changes = [metadata]
}
  metadata = file("$(path.module)/LogicAppDenyHA/metadata.json")
  policy_rule = file("$(path.module)/LogicAppDenyHA/policyRule.json")
  parameters = file("$(path.module)/LogicAppDenyHA/parameters.json")
}

