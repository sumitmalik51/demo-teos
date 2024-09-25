resource "azurerm_log_analytics_workspace" "logAnalytics" {
  for_each            = var.logAnalytics
  name                = each.value["Name"]
  location            = each.value["Location"]
  resource_group_name = each.value["ResourceGroup"]
  sku                 = each.value["SKU"]
  retention_in_days   = each.value["Retention"]
}