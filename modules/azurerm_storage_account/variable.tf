variable "storage_accounts" {
  type = map(object({
    name                     = optional(string)
    resource_group_name      = optional(string)
    location                 = optional(string)
    account_tier             = optional(string)
    account_replication_type = optional(string)
    }
  ))
}