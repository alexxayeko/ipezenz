provider "azurerm" {
  features {}
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "${var.resource_group_name}-vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_recovery_services_protected_vm" "protected_vm" {
  count                        = var.vm_count
  recovery_vault_name          = azurerm_recovery_services_vault.vault.name
  recovery_vault_resource_group = var.resource_group_name
  source_vm_id                 = azurerm_virtual_machine.vm[count.index].id

  backup_policy_id = azurerm_recovery_services_policy.policy.id
}

resource "azurerm_recovery_services_policy_vm" "policy" {
  name                = "${var.resource_group_name}-policy"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  retention_daily {
    count = 7
  }

  retention_weekly {
    count     = 4
    weekday   = 0  # Sunday
  }

  retention_monthly {
    count = 12
    weekday = 0  # Sunday
    monthly_occurrence = 1
  }
}

data "azurerm_virtual_machines" "vm" {
  resource_group_name = var.resource_group_name
}

output "vault_name" {
  description = "Name of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.vault.name
}
