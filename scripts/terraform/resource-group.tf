#
# Creates a resource group for SIT722 in your Azure account.
#

resource "azurerm_resource_group" "sit722" {
  name     = var.app_name
  location = var.location
}