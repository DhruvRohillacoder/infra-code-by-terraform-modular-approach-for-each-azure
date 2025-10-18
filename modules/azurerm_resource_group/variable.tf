variable "resource_groups" {
  type = map(object(
    {
      name       = optional(string)
      location   = optional(string)
      managed_by = optional(string)
      tags       = optional(map(string))
    }
  ))
}
