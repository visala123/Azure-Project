variable "resource_group_name" {
  type    = string
  default = "demo-resourses-rg"
}

variable "resource_group_location" {
  type    = string
  default = "East US"
}

variable "vnet_name" {
  type    = string
  default = "demo-vnet"
}

variable "subnet_name" {
  type    = string
  default = "demo-subnet"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    type        = string  # "public" or "private"
    ip_offset   = number
  }))
}

variable "vm_ssh_public_key" {
  description = "Public key for SSH access"
  type        = string
}