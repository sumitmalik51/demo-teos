resource "azurerm_service_plan" "servicePlan" {
  for_each                     = var.servicePlan
  name                         = each.value["Name"]
  resource_group_name          = each.value["ResourceGroup"]
  location                     = each.value["Location"]
  os_type                      = each.value["OsType"]
  sku_name                     = each.value["SKU"]
  app_service_environment_id   = each.value["EnvId"]
  maximum_elastic_worker_count = each.value["MaxElasWorkCount"]
  worker_count                 = each.value["WorkCount"]
  per_site_scaling_enabled     = each.value["SiteScale"]
  zone_balancing_enabled       = true

}