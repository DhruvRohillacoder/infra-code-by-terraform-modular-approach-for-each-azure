variable "resource_groups" {
  description = "Map of resource groups for this environment"
  type = map(object({
    name       = optional(string)
    location   = optional(string)
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
