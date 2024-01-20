terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"  # Update this version to the latest available
    }
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "test-rg3"
  location = "eastus"
}

resource "azurerm_storage_account" "sg_account" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}


