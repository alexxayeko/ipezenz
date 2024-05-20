variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "environment" {
  description = "Environment tag for the resources"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to protect"
  type        = number
}
