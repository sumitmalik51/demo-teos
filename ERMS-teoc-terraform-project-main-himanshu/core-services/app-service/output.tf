output "App_Name" {
  description = "The name of the App service plan"
  value       = [for App_Name in azurerm_app_service.app : App_Name.name]
}