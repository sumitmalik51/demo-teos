variable "logAnalytics" {
  description = "Log Analytics Workspace"
  type = map(
    object(
      {
        Name          = string,
        ResourceGroup = string,
        Location      = string,
        SKU           = string,
        Retention     = number
      }
    )
  )
}