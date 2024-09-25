output "resource_group_name" {
  value       = [for rg in azurerm_resource_group.resource_groups : rg.name]
  description = "Resource Group Name"
}

output "location" {
  value       = [for rg in azurerm_resource_group.resource_groups : rg.location]
  description = "Resource Group Location"
}

output "resource_group_id" {
  value       = [for rg in azurerm_resource_group.resource_groups : rg.id]
  description = "Resource Group ID"
}