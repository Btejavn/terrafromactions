terraform {
  backend "azurerm" {
    resource_group_name   = "my-rg"
    storage_account_name   = "my-sa"
    container_name         = "sa-container"
    key                    = "terraform.tfstate"
  }
}
