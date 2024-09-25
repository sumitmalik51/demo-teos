resource "azurerm_application_insights" "appInsights" {
  for_each            = var.appInsights
  name                = each.value["Name"]
  location            = each.value["Location"]
  resource_group_name = each.value["ResourceGroup"]
  application_type    = each.value["ApplicationType"]
}