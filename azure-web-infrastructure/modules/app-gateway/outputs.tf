output "appgw_public_ip" {
  description = "Public IP address of the Application Gateway"
  value       = azurerm_public_ip.appgw_public_ip.ip_address
}
