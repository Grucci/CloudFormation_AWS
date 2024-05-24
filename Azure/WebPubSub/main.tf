resource "azurerm_resource_group" "example" {
    name     = "terraform-webpubsub"
    location = "east us"
}

resource "azurerm_web_pubsub" "example" {
    name                = "tfex-webpubsub"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    sku      = "Standard_S1"
    capacity = 1

    public_network_access_enabled = false

    live_trace {
        enabled                   = true
        messaging_logs_enabled    = true
        connectivity_logs_enabled = false
    }

    identity {
        type = "SystemAssigned"
    }
}
