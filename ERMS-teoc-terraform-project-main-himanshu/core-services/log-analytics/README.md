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
| [azurerm_log_analytics_workspace.logAnalytics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_logAnalytics"></a> [logAnalytics](#input\_logAnalytics) | Log Analytics Workspace | <pre>map(<br>    object(<br>      {<br>        Name          = string,<br>        ResourceGroup = string,<br>        Location      = string,<br>        SKU           = string,<br>        Retention     = number<br>      }<br>    )<br>  )</pre> | n/a | yes |

## Outputs

No outputs.
