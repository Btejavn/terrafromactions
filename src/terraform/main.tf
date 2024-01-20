terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"  # Update this version to the latest available
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id
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


