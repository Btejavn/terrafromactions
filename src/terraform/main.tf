terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"  # Update this version to the latest available
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "174f8eaf-055a-4a26-b573-1c3d35723ecb"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "test-rg"
  location = "eastus"
}

resource "azurerm_resource_group" "rg1" {
  name     = "test-r1"
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


