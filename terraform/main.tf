terraform {
  backend "azurerm" {
    storage_account_name  = "nepetersterraformstate"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "vote-app" {
  name     = "vote-app-${terraform.workspace}"
  location = "eastus"
}

resource "azurerm_container_group" "vote-app" {
  name                = "vote-app"
  location            = "${azurerm_resource_group.vote-app.location}"
  resource_group_name = "${azurerm_resource_group.vote-app.name}"
  ip_address_type     = "public"
  dns_name_label      = "${azurerm_resource_group.vote-app.name}-${terraform.workspace}"
  os_type             = "linux"

  container {
    name   = "vote-app"
    image  = "microsoft/aci-helloworld"
    cpu    = "0.5"
    memory = "1.5"
    port   = "80"
  }
}