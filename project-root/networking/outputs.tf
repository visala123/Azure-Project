output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}
