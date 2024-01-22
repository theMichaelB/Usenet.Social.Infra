resource "azurerm_resource_group" "rg" {
  name = "usenet-social"
  location = "uksouth"
}

resource "azurerm_role_assignment" "this_rg" {
  for_each = var.rg_role_assignment
  scope                = azurerm_resource_group.rg.id
  role_definition_name = each.value
  principal_id         = each.key
}

# create managed id 
resource "azurerm_user_assigned_identity" "this" {
  name                = "usenet-social-mi"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
variable "managed_id_scopes" {
    type    = map(string)
    default = {
        "/subscriptions/650b0005-4d5f-464e-b62b-6b916fc03a9f/resourceGroups/dns-zones/providers/Microsoft.Network/dnszones/usenet.social" = "DNS Zone Contributor"
        # Add more resource IDs and scopes as needed
    }
}

variable "rg_role_assignment" {
    type    = map(string)
    default = {
        "ce8dc9c4-579a-40d7-ba6b-5c9f3da0a67c" = "Contributor"
    }
}
resource "azurerm_role_assignment" "this" {
    for_each = var.managed_id_scopes
    scope                = each.key
    role_definition_name = each.value
    principal_id         = azurerm_user_assigned_identity.this.principal_id
}
