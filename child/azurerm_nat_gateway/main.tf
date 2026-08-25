resource "azurerm_nat_gateway" "nat" {
  for_each            = var.nats
  name                = each.value.natname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

}