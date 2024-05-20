output "web_vm_ids" {
  description = "IDs of the web virtual machines"
  value       = module.virtual_machines.web_vm_ids
}

output "db_vm_id" {
  description = "ID of the database virtual machine"
  value       = module.virtual_machines.db_vm_id
}

output "lb_public_ip" {
  description = "Public IP address of the load balancer"
  value       = module.load_balancer.lb_public_ip
}

output "appgw_public_ip" {
  description = "Public IP address of the application gateway"
  value       = module.app_gateway.appgw_public_ip
}

output "sql_server_fqdn" {
  description = "Fully qualified domain name (FQDN) of the SQL server"
  value       = module.sql_database.sql_server_fqdn
}

output "key_vault_name" {
  description = "Name of the Azure Key Vault"
  value       = module.key_vault.key_vault_name
}
