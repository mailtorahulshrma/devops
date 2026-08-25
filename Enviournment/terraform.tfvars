rgs = {
  rg1 = {
    name     = "prod-rg"
    location = "southindia"
  }
  rg2 = {
    name     = "prod-rg2"
    location = "southindia"
  }
  rg3 = {
    name     = "prod-rg3"
    location = "southindia"
  }
}
vnets = {
  vnet1 = {
    name                = "prod-vnet"
    location            = "southindia"
    resource_group_name = "prod-rg"
    address_space       = ["10.1.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "prod-frontend"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.1.0.0/24"]
  }
  subnet2 = {
    name                 = "prod-backend"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.1.2.0/26"]
  }
  subnet4 = {
    name                 = "appgatewaysubnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"
    address_prefixes     = ["10.1.3.0/26"]
  }
}
bastion = {
  bastion1 = {
    pubname             = "prod-bastion-pubip"
    location            = "southindia"
    resource_group_name = "prod-rg"
    bastion_name        = "prod-bastion"
    ipconfig_name       = "prod-bastionipconfig"



  }
}
vms = {
  vm1 = {
    subnetname           = "prod-frontend"
    virtual_network_name = "prod-vnet"
    resource_group_name  = "prod-rg"
    nicname              = "prod-frontend-nic"
    location             = "southindia"
    nicipname            = "prod-frontendvm-nic"
    vmnames              = "prod-frontendvm"


  }
}
