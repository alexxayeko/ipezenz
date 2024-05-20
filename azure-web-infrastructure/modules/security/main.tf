provider "azurerm" {
  features {}
}

# Create Azure Security Center
resource "azurerm_security_center_subscription_pricing" "security_center" {
  tier                = "Standard"
}

# Create Azure Security Center Contact
# resource "azurerm_security_center_contact" "security_contact" {
#   name                = "${var.resource_group_name}-contact"
#   resource_group_name = var.resource_group_name
#   alert_notifications = "On"
#   alerts_to_admins     = "On"
#   email_notifications {
#     send_to_admins = "On"
#   }
# }
resource "azurerm_security_center_contact" "example" {
  name  = "contact"
  email = "bamiayo770@gmail.com"
  phone = "+234-90-3301-6873"

  alert_notifications = true
  alerts_to_admins    = true
}
# # Create Azure Security Center Policy
# resource "azurerm_security_policy" "security_policy" {
#   name                = "${var.resource_group_name}-policy"
#   resource_group_name = var.resource_group_name
#   policy {
#     ...
#     # Define your security policy here
#     ...
#   }
# }


