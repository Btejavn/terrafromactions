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



