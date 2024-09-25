resource "azurerm_key_vault" "keyVault" {
  for_each = var.keyVault
  #checkov:skip=CKV2_AZURE_32:The KV is used to store app registration secrets only and not accessed by other Azure resources.
  name                          = each.value["Name"]
  location                      = each.value["Location"]
  resource_group_name           = each.value["DiskEncryptionEnabled"]
  enabled_for_disk_encryption   = each.value["ResourceGroup"]
  tenant_id                     = each.value["Tenant"]
  soft_delete_retention_days    = each.value["SoftDeleteRetention"]
  purge_protection_enabled      = each.value["purge_protection_enabled"]
  sku_name                      = each.value["SKU"]
  public_network_access_enabled = each.value["public_network_access_enabled"]

  dynamic "network_acls" {
    for_each = each.value["network_acls"] != null ? each.value["network_acls"] : {}
    content {
      default_action = network_acls.value["default_action"]
      bypass         = network_acls.value["bypass"]
    }
  }
}

