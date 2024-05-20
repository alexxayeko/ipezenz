variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "web_vm_count" {
  description = "Number of web VMs to create"
  type        = number
  default     = 2
}

variable "vm_os_disk_size_gb" {
  description = "OS disk size in GB for both web and db VMs"
  type        = number
  default     = 128
}

variable "web_vm_size" {
  description = "Size of the web VMs"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "db_vm_size" {
  description = "Size of the database VM"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
}
