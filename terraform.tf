provider "azurerm" {
  features {}
  version = "~>2.0"
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "primary_access_key" {
  value = azurerm_storage_account.sa.primary_access_key
}