resource "azurerm_public_ip" "public" {
  for_each            = { for k, v in var.vms : k => v if v.type == "public" }
  name                = "${each.key}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = "nic-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.subnet_cidr, each.value.ip_offset)
    public_ip_address_id          = each.value.type == "public" ? azurerm_public_ip.public[each.key].id : null
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  for_each = var.vms
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = var.nsg_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.vms
  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_key
  }
}
