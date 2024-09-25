output "App_insights_instrumentation_key" {
  description = "The instrumentation key of the Application Insights"
  value       = [for App_insights_instrumentation_key in azurerm_application_insights.appInsights : App_insights_instrumentation_key.instrumentation_key]
}

output "App_insights_connection_string" {
  description = "The instrumentation key of the Application Insights"
  value       = [for App_insights_connection_string in azurerm_application_insights.appInsights : App_insights_connection_string.connection_string]
}