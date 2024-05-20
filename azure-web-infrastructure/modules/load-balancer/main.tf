provider "azurerm" {
  features {}
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "lb" {
  name                = "lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  name                = "http-probe"
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lb_rule" {
  name                            = "http-rule"
  loadbalancer_id                 = azurerm_lb.lb.id
  protocol                        = "Tcp"
  frontend_ip_configuration_name  = "frontend"
  frontend_port                   = 80
  backend_port                    = 80
  backend_address_pool_ids         = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id                        = azurerm_lb_probe.lb_probe.id
  enable_floating_ip              = false
  idle_timeout_in_minutes         = 5
  load_distribution               = "Default"
}

output "lb_public_ip" {
  description = "Public IP address of the Load Balancer"
  value       = azurerm_public_ip.lb_public_ip.ip_address
}
