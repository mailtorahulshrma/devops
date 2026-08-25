module "azurerm_resource_group" {
  source = "../child/azurerm_resource_group"
  rgs    = var.rgs


}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../child/azurerm_virtual_network"
  vnets      = var.vnets

}
module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../child/azurerm_subnet"
  subnets    = var.subnets

}
module "azurerm_bastion" {
  depends_on = [module.azurerm_subnet]
  source     = "../child/azurerm_bastion"
  bastion    = var.bastion
}
module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_bastion]
  source     = "../child/azurerm_virtual_machine"
  vms        = var.vms
}