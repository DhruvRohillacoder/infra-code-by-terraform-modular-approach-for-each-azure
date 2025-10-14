

resource "azurerm_resource_group" "dd_rg" {
  for_each = {

    rg1 = {
      name     = "rg1"
      location = "Eastus"

      managed_by = "rg1 ne banaya"
      tag = {
        environment = "dev"
        owner       = "rg1 ne banaya"
      }
    }
    rg2 = {
      name       = "rg2"
      location   = "Centralus"
      managed_by = "rg2 ne banaya"
      tag = {
        environment = "dev"
        owner       = "rg2 ne banaya"
      }
    }
    rg3 = {

      name       = "rg3"
      location   = "Westus"
      managed_by = "rg3 ne banaya"
      tag = {
        environment = "dev"
        owner       = "rg3 ne banaya"
      }
    }
  }
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by

}