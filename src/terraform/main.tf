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
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
    ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_name
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]  # Customize the address space as needed
}
 resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]
}
