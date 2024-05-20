provider "azurerm" {
  features {}
}

resource "azurerm_availability_set" "web_avset" {
  name                = "web-avset"
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true
}

resource "azurerm_virtual_machine" "web_vm" {
  count               = var.web_vm_count
  name                = "web-vm-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  availability_set_id = azurerm_availability_set.web_avset.id

  network_interface_ids = [
    element(azurerm_network_interface.web_nic.*.id, count.index)
  ]

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "web-os-disk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = var.vm_os_disk_size_gb
  }

  os_profile {
    computer_name  = "web-vm-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {}

  vm_size = var.web_vm_size
}

resource "azurerm_virtual_machine" "db_vm" {
  name                = "db-vm"
  location            = var.location
  resource_group_name = var.resource_group_name

  network_interface_ids = [
    azurerm_network_interface.db_nic.id
  ]

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "db-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = var.vm_os_disk_size_gb
  }

  os_profile {
    computer_name  = "db-vm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {}

  vm_size = var.db_vm_size
}

