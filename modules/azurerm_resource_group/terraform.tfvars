resource_groups = {  #! variable
  rg1 = {            #? key
    name     = "rg1" # value
    location = "Eastus"

    managed_by = "rg1 ne banaya"
    tags = {
      environment = "dev"
      owner       = "rg1 ne banaya"
    }
  }
  rg2 = {
    name       = "rg2"
    location   = "Centralus"
    managed_by = "rg2 ne banaya"
    tags = {
      environment = "preprod"
      owner       = "rg2 ne banaya"
    }
  }
  rg3 = {

    name     = "rg3"
    location = "Westus"
    # managed_by = "rg3 ne banaya"
    # tags = {
    #   environment = "prod"
    #   owner       = "rg3 ne banaya"
    # }
} }