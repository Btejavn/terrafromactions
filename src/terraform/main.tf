terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
    
  }
  
# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = "adminuser"
  admin_password        = "Password1234!"  # Replace with your own secure password
  network_interface_ids = var.nic
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]  # Customize the address space as needed

  subnet {
    name           = var.subnet_name
    address_prefix = "10.0.1.0/24"  # Customize the subnet address space as needed
  }
}


