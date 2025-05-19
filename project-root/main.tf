module "networking" {
  source = "./networking"
 resource_group_name    = azurerm_resource_group_name
  resource_group_location = azurerm_resource_group_location
  vnet_name           = var.vnet_name
  subnet_name         = var.subnet_name
  address_space       = var.address_space
  subnet_prefix       = var.subnet_prefix
}

module "vms" {
  source                  = "./vm"
  resource_group_name     = module.networking.resource_group_name
  resource_group_location = module.networking.resource_group_location
  #location            = var.location
  subnet_id           = module.networking.subnet_id
  nsg_id              = module.networking.nsg_id
  vms                 = var.vms
  subnet_cidr         = var.subnet_prefix
  vm_ssh_public_key   = var.vm_ssh_public_key
}
