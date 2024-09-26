---

## TO-DO List Items

The following tasks are pending and need to be completed in the TEOC GitHub repository:

### Get Alerts for Pushes in the GitHub Repository

To set up alerts for any new pushes to the GitHub repository, follow the steps outlined below:

You can configure automatic email notifications to be sent to a specific email address whenever anyone pushes to the repository.

#### Who Can Use This Feature?

This feature is available to users with admin permissions on the repository.

#### Enabling Email Notifications for Pushes to Your Repository

Each email notification for a push will include a summary of the new commits and links to a diff containing those commits. The email notification will provide:

- The name of the repository where the commit was made
- The branch in which the commit was made
- The SHA1 of the commit, including a link to the diff on GitHub
- The author of the commit
- The date when the commit was made
- The files that were changed as part of the commit
- The commit message

You can also filter the email notifications you receive for pushes. For more information, see "Configuring notifications."

#### Steps to Enable Email Notifications for Pushes

1. Go to the main page of the repository on GitHub.
2. Under your repository name, click **Settings**. If the "Settings" tab is not visible, select the dropdown menu and then click **Settings**.
3. In the sidebar, under the "Integrations" section, click **Email notifications**.
4. In the "Address" field, enter up to two email addresses, separated by whitespace, where you'd like to receive notifications. If you need to send emails to more than two addresses, use a group email address.
5. Click **Set up notifications** to complete the process.

### Setup Alerts and Dashboard for Azure Login Apps for Monitoring


# To Setup the Dashboard, you can take sample from the below code: 

```
resource "azurerm_dashboard" "example" {
  name                = "example-dashboard"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  tags = {
    environment = "Production"
  }

  properties = jsonencode({
    lenses = [
      {
        order    = 0
        parts    = [
          {
            position = {
              x = 0
              y = 0
              colSpan = 3
              rowSpan = 4
            }
            metadata = {
              inputs = []
              type   = "Extension/MarkdownPart"
              settings = {
                content = "## Azure Logic App Monitoring Dashboard"
              }
            }
          },
          {
            position = {
              x = 3
              y = 0
              colSpan = 9
              rowSpan = 6
            }
            metadata = {
              inputs = []
              type   = "Extension/ActivityLogAnalyticsPart"
              settings = {
                query = "AzureDiagnostics | where ResourceType == 'WORKFLOWS' and OperationName == 'Microsoft.Logic/workflows/workflow/run/action' | summarize count() by ActivityStatus"
              }
            }
          }
        ]
      }
    ]
    metadata = {
      model = {
        timeRange = {
          value = "24h"
          type  = "Relative"
        }
        metadataVersion = "1"
      }
    }
  })
}
```
