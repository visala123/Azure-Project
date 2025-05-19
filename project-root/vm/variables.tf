variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "subnet_id" { type = string }
variable "nsg_id" { type = string }
variable "subnet_cidr" { type = string }
variable "vm_ssh_public_key" { type = string }

variable "vms" {
  type = map(object({
    type        = string
    ip_offset   = number
  }))
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}
