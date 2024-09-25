data "azurerm_resource_group" "rg" {
  for_each = var.appService
  name     = each.value["rg_name"]

}

data "azurerm_service_plan" "dataServicePlan" {
  for_each            = var.appService
  name                = each.value["service_plan_name"]
  resource_group_name = ["service_plan_rg"]
}

data "azurerm_application_insights" "appInsights" {
  for_each            = var.appService
  resource_group_name = ["service_plan_rg"]
  name                = each.value["appInsights_name"]

}

resource "azurerm_windows_web_app" "app" {
  for_each            = var.appService
  name                = each.value["web_appName"]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_service_plan.dataServicePlan.location
  service_plan_id     = data.azurerm_service_plan.dataServicePlan.id
  https_only          = each.value["https_only"]

  client_certificate_enabled = each.value["client_certificate_enabled"]

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = data.azurerm_application_insights.appInsights.Key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = data.azurerm_application_insights.appInsights.connection_string
    "SITE_ROLE"                             = var.SITE_ROLE
    "REACT_APP_CLIENT_ID"                   = var.REACT_APP_CLIENT_ID
    "REACT_APP_START_LOGIN_PAGE_URL"        = var.REACT_Login_URL
    "WEBSITE_NODE_DEFAULT_VERSION"          = var.WEBSITE_NODE_DEFAULT_VERSION
    "GENERATE_SOURCEMAP"                    = var.GENERATE_SOURCEMAP
    "REACT_APP_SHAREPOINT_SITE_NAME"        = var.REACT_APP_SHAREPOINT_SITE_NAME
    "REACT_APP_GRAPH_BASE_URL"              = var.REACT_APP_GRAPH_BASE_URL
    ftps_state                              = var.ftps_state
    health_check_path                       = var.health_check_path
    always_on                               = var.always_on
    dotnet_framework_version                = var.dotnet_framework_version
    client_cert_enabled                     = var.client_cert_enabled
    failed_request_tracing_enabled          = var.failed_request_tracing_enabled
  }


  dynamic "site_config" {
    for_each = each.value["site_config"] != null ? each.value["site_config"] : {}
    content {
      always_on         = site_config.value["always_on"]
      ftps_state        = site_config.value["ftps_state"]
      health_check_path = "/health"
      http2_enabled     = site_config.value["http2_enabled"]
      dynamic "application_stack" {
        for_each = site_config.value["application_stack"] != null ? site_config.value["application_stack"] : {}
        content {
          current_stack  = application_stack.value["current_stack"]
          dotnet_version = application_stack.value["dotnet_version"]
        }
      }
    }
  }
}


resource "azurerm_app_service_source_control" "sourcecontroldeployment" {
  for_each = var.appService
  app_id   = azurerm_windows_web_app.app.id

  repo_url = each.value.git_repo_url
  branch   = each.value.git_branch
}


