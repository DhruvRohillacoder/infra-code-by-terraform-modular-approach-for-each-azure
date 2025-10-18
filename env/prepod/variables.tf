variable "resource_groups" {
  #   description = "Map of resource groups for this environment"
  type = map(object({
    name       = optional(string)
    location   = optional(string)
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "storage_accounts" {
  #   description = "Map of storage accounts for this environment"
  type = map(object({
    name                     = optional(string)
    resource_group_name      = optional(string)
    location                 = optional(string)
    account_tier             = optional(string)
    account_replication_type = optional(string)
  }))
}
