terraform {
  backend "azurerm" {
    resource_group_name   = "my_rg"
    storage_account_name   = "mystname"
    container_name         = "tfstate"
    key                    = "terraform.tfstate"
  }
}
