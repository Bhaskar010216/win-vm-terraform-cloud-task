resource "azurerm_resource_group" "sunny" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "sunny" {
  name                = var.vn
  address_space       = var.as
  location            = azurerm_resource_group.sunny.location
  resource_group_name = azurerm_resource_group.sunny.name
}

resource "azurerm_subnet" "sunny" {
  name                 = var.sn
  resource_group_name  = azurerm_resource_group.sunny.name
  virtual_network_name = azurerm_virtual_network.sunny.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "sunny" {
  name                = var.ip
  resource_group_name = azurerm_resource_group.sunny.name
  location            = azurerm_resource_group.sunny.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "sunny" {
  name                = var.nic
  location            = azurerm_resource_group.sunny.location
  resource_group_name = azurerm_resource_group.sunny.name

ip_configuration {
  name                          = "internal"
  subnet_id                     = azurerm_subnet.sunny.id
  public_ip_address_id          = azurerm_public_ip.sunny.id
  private_ip_address_allocation = "Dynamic"
}
}
resource "azurerm_network_security_group" "sunny" {
  name                = "sunny-nsg"
  location            = azurerm_resource_group.sunny.location
  resource_group_name = azurerm_resource_group.sunny.name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "sunny" {
  subnet_id                 = azurerm_subnet.sunny.id
  network_security_group_id = azurerm_network_security_group.sunny.id
}

resource "azurerm_windows_virtual_machine" "example" {
  name                  = var.vmname
  resource_group_name   = azurerm_resource_group.sunny.name
  location              = azurerm_resource_group.sunny.location
  size                  = var.size
  admin_username        = var.username
  admin_password        = var.password
  network_interface_ids = [azurerm_network_interface.sunny.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
