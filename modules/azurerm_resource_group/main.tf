resource "azurerm_resource_group" "RG" {
  for_each   = var.resource_groups
  name       = each.key              # Required
  location   = each.value.location   # Required
  managed_by = each.value.managed_by #Optional
  tags       = each.value.tags       # Optional
}