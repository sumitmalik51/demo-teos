## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_service_plan.servicePlan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_servicePlan"></a> [servicePlan](#input\_servicePlan) | Service Plan | <pre>map(<br>    object(<br>      {<br>        Name             = string,<br>        ResourceGroup    = string,<br>        Location         = string,<br>        OsType           = string,<br>        SKU              = string,<br>        EnvId            = optional(string),<br>        MaxElasWorkCount = optional(number),<br>        WorkCount        = optional(number),<br>        SiteScale        = optional(bool),<br>        ZoneBalancing    = optional(bool)<br>      }<br>    )<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_App_Service_plan_Name"></a> [App\_Service\_plan\_Name](#output\_App\_Service\_plan\_Name) | The name of the App service plan |
