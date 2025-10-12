terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Configuration options
  subscription_id = "3cda432b-5619-43d2-9c92-3b490f89de92"
}