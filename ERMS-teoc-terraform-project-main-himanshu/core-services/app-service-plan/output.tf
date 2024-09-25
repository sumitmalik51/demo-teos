output "App_Service_plan_Name" {
  description = "The name of the App service plan"
  value       = [for App_Service_plan_Name in azurerm_service_plan.servicePlan : App_Service_plan_Name.name]
}