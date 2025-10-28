variable "storage_accounts" {
  description = "Map of Azure Storage Accounts with all 27 top-level arguments (all optional)"
  type = map(object({
    name                               = string
    resource_group_name                = string
    location                           = string
    account_kind                       = optional(string)
    account_tier                       = optional(string)
    account_replication_type           = optional(string)
    access_tier                        = optional(string)
    allow_blob_public_access           = optional(bool)
    enable_https_traffic_only          = optional(bool)
    is_hns_enabled                     = optional(bool)
    min_tls_version                    = optional(string)
    allow_nested_items_to_be_public    = optional(bool)
    shared_access_key_enabled          = optional(bool)
    cross_tenant_replication_enabled   = optional(bool)
    default_to_oauth_authentication    = optional(bool)
    edge_zone                          = optional(string)
    public_network_access_enabled      = optional(bool)
    nfsv3_enabled                      = optional(bool)
    large_file_share_enabled           = optional(bool)
    infrastructure_encryption_enabled  = optional(bool)
    queue_encryption_key_type          = optional(string)
    table_encryption_key_type          = optional(string)
    enable_azure_files_aad_integration = optional(bool)
    allow_shared_key_access            = optional(bool)
    dns_endpoint_type                  = optional(string)
    sftp_enabled                       = optional(bool)
    tags                               = optional(map(string))
  }))
}
