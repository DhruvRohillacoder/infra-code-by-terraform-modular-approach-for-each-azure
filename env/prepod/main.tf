module "Rg" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}
module "stg" {
  depends_on = [module.Rg]
  source     = "../../modules/azurerm_storage_account"
}
