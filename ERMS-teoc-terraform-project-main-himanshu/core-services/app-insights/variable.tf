variable "appInsights" {
  description = "App Insights"
  type = map(
    object(
      {
        Name            = string,
        ResourceGroup   = string,
        Location        = string,
        ApplicationType = string
      }
    )
  )
}