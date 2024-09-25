resourceGroup = [
  {
    Name     = "rg-teoc-dev-uksouth-01"
    Location = "uk-south"
  }
]

servicePlan = [
  {
    Name          = "asp-teoc-dev-uksouth-02"
    Location      = "uk-south"
    ResourceGroup = "rg-teoc-dev-uksouth-01"
    OsType        = "windows"
    SKU           = "S1"
  }
]

appService = [
  {
    rg_name                    = "rg-teoc-dev-uksouth-01"
    service_plan_name          = "asp-teoc-dev-uksouth-02"
    service_plan_rg            = "rg-teoc-dev-uksouth-01"
    appInsights_name           = "appi-teoc-dev-uksouth-02"
    web_appName                = "teocdev02"
    https_only                 = true
    client_certificate_enabled = true
    git_repo_url               = "https://github.com/example/repo1"
    git_branch                 = "main"
    site_config = {
      always_on     = true
      ftps_state    = "disabled"
      http2_enabled = true
      application_stack = {
        current_stack  = "dotnet"
        dotnet_version = "v6.0"
      }
    }
  }
]

appInsights = [
  {
    Name            = "appi-teoc-dev-uksouth-02"
    Location        = "uk-south"
    ResourceGroup   = "rg-teoc-dev-uksouth-01"
    ApplicationType = "web"
  }
]

logAnalytics = [
  {
    Name          = "law-teoc-dev-uksouth-02"
    Location      = "uk-south"
    ResourceGroup = "rg-teoc-dev-uksouth-01"
    SKU           = "PerGB2028"
    Retention     = 30
  }
]

keyVault = [
  {
    Name                         = "kv-teoc-dev-uksouth-02"
    Location                     = "uk-south"
    ResourceGroup                = "rg-teoc-dev-uksouth-01"
    DiskEncryptionEnabled        = true
    Tenant                       = "ee4e1499-4a35-4b2e-ad47-5f3cf9de8666"
    SoftDeleteRetention          = 7
    purge_protection_enabled     = true
    SKU                          = "standard"
    public_network_access_enabled = false
    network_acls = {
      default_action = "Deny"
      bypass         = "AzureServices"
    }
  }
]

# Application settings 
SITE_ROLE                      = "app"
REACT_APP_CLIENT_ID            = "ClientID"
REACT_Login_URL                = "auth-start.html"
WEBSITE_NODE_DEFAULT_VERSION   = "16.13.0"
GENERATE_SOURCEMAP             = "false"
REACT_APP_SHAREPOINT_SITE_NAME = "Sharepointsitename"
REACT_APP_GRAPH_BASE_URL       = "https://graph.microsoft.us/"
ftps_state                     = "Disabled"
health_check_path              = "/health"
always_on                      = true
dotnet_framework_version       = "v4.0"
client_cert_enabled            = true
failed_request_tracing_enabled = true
