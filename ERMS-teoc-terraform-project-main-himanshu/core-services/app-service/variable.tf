variable "appService" {
  description = "appService"
  type = map(
    object(
      {
        rg_name           = string
        service_plan_name = string
        service_plan_rg   = string
        web_appName       = string
        SKU               = string
        site_config = map(object({
          always_on     = optional(bool)
          ftps_state    = optional(bool)
          http2_enabled = optional(bool)
          application_stack = map(object({
            current_stack  = string
            dotnet_version = string
          }))
        }))
      }
    )
  )
}
variable "SITE_ROLE" {
  type        = string
  description = "value for app setting SITE ROLE"
}

variable "REACT_APP_CLIENT_ID" {
  type        = string
  description = "value for app setting REACT_APP_CLIENT_ID"
}
variable "REACT_Login_URL" {
  type        = string
  description = "value for app setting REACT_Login_URL"
}
variable "WEBSITE_NODE_DEFAULT_VERSION" {
  type        = string
  description = "value for app setting WEBSITE_NODE_DEFAULT_VERSION"
}
variable "GENERATE_SOURCEMAP" {
  type        = string
  description = "value for app setting GENERATE_SOURCEMAP"
}
variable "REACT_APP_SHAREPOINT_SITE_NAME" {
  type        = string
  description = "value for app setting REACT_APP_SHAREPOINT_SITE_NAME"
}
variable "REACT_APP_GRAPH_BASE_URL" {
  type        = string
  description = "value for app setting REACT_APP_GRAPH_BASE_UR"
}
variable "ftps_state" {
  type        = string
  description = "value for app setting ftps_state"
}
variable "health_check_path" {
  type        = string
  description = "value for app setting health_check_path"
}
variable "always_on" {
  type        = string
  description = "value for app setting always_on"
}
variable "dotnet_framework_version" {
  type        = string
  description = "value for app setting dotnet_framework_version"
}
variable "client_cert_enabled" {
  type        = string
  description = "value for app setting client_cert_enabled"
}
variable "failed_request_tracing_enabled" {
  type        = string
  description = "value for app setting failed_request_tracing_enabled"
}

