output "security_center_name" {
  description = "Name of the Azure Security Center"
  value       = azurerm_security_center_subscription_pricing.security_center.name
}

output "security_contact_name" {
  description = "Name of the Azure Security Center Contact"
  value       = azurerm_security_center_contact.security_contact.name
}

output "security_policy_name" {
  description = "Name of the Azure Security Policy"
  value       = azurerm_security_policy.security_policy.name
}