module "Rg" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups //rg
}
module "stg" {
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts //stg
}