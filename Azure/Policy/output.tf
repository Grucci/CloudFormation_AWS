output "logicappdenyha" {
    value       = "$(azurerm_policy_definition.logicappdenyha.id)"
    description = "$(azurerm_policy_definition.logicappdenyha.description)"
}