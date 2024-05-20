provider "azurerm" {
  features {}
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "sqlserver${random_string.random.result}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.sql_admin_username.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password.value

  threat_detection_policy {
    state = "Enabled"
  }
}

resource "azurerm_sql_database" "sql_db" {
  name                = "sqldb"
  resource_group_name = azurerm_sql_server.sql_server.resource_group_name
  location            = azurerm_sql_server.sql_server.location
  server_name         = azurerm_sql_server.sql_server.name
  edition             = "Standard"
  requested_service_objective_name = "S0"
}

resource "random_string" "random" {
  length  = 8
  special = false
}

output "sql_server_name" {
  description = "Name of the SQL Server"
  value       = azurerm_sql_server.sql_server.name
}

output "sql_db_name" {
  description = "Name of the SQL Database"
  value       = azurerm_sql_database.sql_db.name
}
