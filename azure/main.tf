//terraform {
//  backend "remote" {
//    hostname = ""
//    organization = "org-sgpvfvrkj5ao2j0"
//    workspaces {
//      name = "olegazure"
//    }
//  }
//}

provider "azurerm" {
  client_id = var.scalr_azurerm_client_id
  client_secret = var.scalr_azurerm_client_secret
  subscription_id = var.scalr_azurerm_subscription_id
  tenant_id = var.scalr_azurerm_tenant_id
  environment = var.scalr_azurerm_environment
}

resource "azurerm_virtual_machine" "oleg1" {
  location = "East US"
  name = "olegtf"
  network_interface_ids = ["revizor"]
  resource_group_name = "revizor"
  vm_size = "Basic_A0"
  tags = {
    owner = "oleg"
  }

  storage_os_disk {
    create_option = "FromImage"
    name = "olegdisk"
  }
}
