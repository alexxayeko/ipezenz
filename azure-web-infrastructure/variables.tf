variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "admin_username" {
  description = "Admin user pusername"
} 

variable "admin_password" {
  description = "Admin user username"
}

variable "environment" {
  description = "Environment"
}

variable "vm_count" {
  default = 2
}