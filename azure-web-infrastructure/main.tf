provider "azurerm" {
  features {}
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "virtual_machines" {
  source              = "./modules/virtual-machines"
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_password = var.admin_password
  admin_username = var.admin_username
}

module "load_balancer" {
  source              = "./modules/load-balancer"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "app_gateway" {
  source              = "./modules/app-gateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  web_subnet_id       = module.networking.web_subnet_id
}

module "sql_database" {
  source              = "./modules/sql-database"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "key_vault" {
  source              = "./modules/key-vault"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "backup" {
  source              = "./modules/backup"
  vm_count = var.vm_count
  resource_group_name = var.resource_group_name
  location            = var.location
  environment = var.environment
}

module "security" {
  source              = "./modules/security"
  resource_group_name = var.resource_group_name
  # location            = var.location
}









