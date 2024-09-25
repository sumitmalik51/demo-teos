variable "keyVault" {
  description = "Key Vault"
  type = map(
    object(
      {
        Name                   = string,
        ResourceGroup          = string,
        Location               = string,
        Tenant                 = string,
        SoftDeleteRetention    = number,
        DiskEncryptionEnabled  = bool,
        PurgeProtectionEnabled = bool,
        SKU                    = string
      }
    )
  )
}