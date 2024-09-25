variable "servicePlan" {
  description = "Service Plan"
  type = map(
    object(
      {
        Name             = string,
        ResourceGroup    = string,
        Location         = string,
        OsType           = string,
        SKU              = string,
        EnvId            = optional(string),
        MaxElasWorkCount = optional(number),
        WorkCount        = optional(number),
        SiteScale        = optional(bool),
        ZoneBalancing    = optional(bool)
      }
    )
  )
}