resource "azurerm_public_ip" "publicip" {
  for_each            = var.bastion
  name                = each.value.pubname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}
data "azurerm_resource_group" "rg" {
  name = "prod-rg"
}
data "azurerm_public_ip" "pubip" {
  depends_on          = [azurerm_public_ip.publicip]
  name                = "prod-bastion-pubip"
  resource_group_name = "prod-rg"
}
data "azurerm_subnet" "subnets" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "prod-vnet"
  resource_group_name  = "prod-rg"
}


resource "azurerm_bastion_host" "bastion" {
  depends_on = [data.azurerm_public_ip.pubip, data.azurerm_subnet.subnets]

  for_each            = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name



  ip_configuration {
    name                 = each.value.ipconfig_name
    subnet_id            = data.azurerm_subnet.subnets.id
    public_ip_address_id = data.azurerm_public_ip.pubip.id
  }
}