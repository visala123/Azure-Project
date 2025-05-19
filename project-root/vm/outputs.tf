output "vm_nics" {
  value = azurerm_network_interface.nic
}

output "vms" {
  value = azurerm_linux_virtual_machine.vm
}
output "vm_public_ip" {
  value = azurerm_public_ip.public["vm-public"].ip_address
}
