resource "azurerm_storage_account" "stg" {
  for_each = {
    stg = {
      name                     = "livestg1"
      resource_group_name      = "rg1"
      location                 = "centralindia"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
    stg2 = {
      name                     = "livestg2"
      location                 = "centralindia"
      account_tier             = "Standard"
      resource_group_name      = "rg2"
      account_replication_type = "GRS"
    }
  }
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}