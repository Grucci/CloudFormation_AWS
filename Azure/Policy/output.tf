## Display the Policy Logic App  High Availability Deny ID
output "logicappdenyha" {
    value       = azurerm_policy_definition.logicappdenyha.id
}

## Display the Policy Logic App  High Availability Audit ID
output "logicappauditha" {
    value       = azurerm_policy_definition.logicappauditha.id
}

## Display the Policy Logic App  High Availability Disable ID
output "logicappdisableha" {
    value       = azurerm_policy_definition.logicappdisableha.id
}