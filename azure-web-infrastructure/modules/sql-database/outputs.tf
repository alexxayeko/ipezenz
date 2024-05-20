output "sql_server_name" {
  description = "Name of the SQL Server"
  value       = azurerm_sql_server.sql_server.name
}

output "sql_db_name" {
  description = "Name of the SQL Database"
  value       = azurerm_sql_database.sql_db.name
}
