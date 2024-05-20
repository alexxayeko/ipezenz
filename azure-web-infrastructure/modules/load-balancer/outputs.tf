output "lb_public_ip" {
  description = "Public IP address of the Load Balancer"
  value       = azurerm_public_ip.lb_public_ip.ip_address
}
