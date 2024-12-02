provider "azurerm" {
  features {}

  subscription_id = "efc1e7b1-5729-4eea-b33e-12cc6b1c0183"
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "rg-backendsha"
  location = "Norway East"
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "stterraformsha"
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.backend_sa.name
  container_access_type = "private"
}
