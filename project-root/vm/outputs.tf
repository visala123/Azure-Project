output "vm_nics" {
  value = azurerm_network_interface.nic
}

output "vms" {
  value = azurerm_linux_virtual_machine.vm
}
