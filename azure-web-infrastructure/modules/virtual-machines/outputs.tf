output "web_vm_ids" {
  description = "IDs of the web virtual machines"
  value       = azurerm_virtual_machine.web_vm[*].id
}

output "db_vm_id" {
  description = "ID of the database virtual machine"
  value       = azurerm_virtual_machine.db_vm.id
}
