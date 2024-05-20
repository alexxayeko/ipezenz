variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "web_subnet_id" {
  description = "ID of the web subnet"
  type        = string
}
