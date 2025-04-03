variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
}

variable "dns_servers" {
  description = "Custom DNS servers"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name                   = string
    address_prefixes       = list(string)
    delegation_name        = optional(string)
    service_delegation_name = optional(string)
    actions                = optional(list(string))
  }))
  default = []
}

variable "tags" {
  description = "Tags to associate with the VNet"
  type        = map(string)
  default     = {}
}
