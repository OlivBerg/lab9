terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "rg-terraform-demo"
  location = "West US 2"
}

resource "azurerm_storage_account" "main" {
  name                     = "storageaccountlab9"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_id" {
  valueq       = azurerm_storage_account.main.id
  description = "The ID of the created storage account"
}