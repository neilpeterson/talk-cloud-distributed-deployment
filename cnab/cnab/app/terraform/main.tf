provider "azurerm" {
  version         = "1.29.0"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}


resource "azurerm_resource_group" "twitter-sentiment" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_cognitive_account" "twitter-sentiment" {
  name                = "${var.resource-prefix}"
  location            = "${azurerm_resource_group.twitter-sentiment.location}"
  resource_group_name = "${azurerm_resource_group.twitter-sentiment.name}"
  kind                = "TextAnalytics"

  sku {
    name = "S0"
    tier = "Standard"
  }
}

resource "azurerm_storage_account" "twitter-sentiment" {
  name                     = "${var.resource-prefix}${random_integer.ri.result}"
  resource_group_name      = "${azurerm_resource_group.twitter-sentiment.name}"
  location                 = "${azurerm_resource_group.twitter-sentiment.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_queue" "twitter-sentiment" {
  name                 = "${var.resource-prefix}"
  resource_group_name  = "${azurerm_resource_group.twitter-sentiment.name}"
  storage_account_name = "${azurerm_storage_account.twitter-sentiment.name}"
}

resource "azurerm_cosmosdb_account" "twitter-sentiment" {
  name                = "${var.resource-prefix}-${random_integer.ri.result}"
  location            = "${azurerm_resource_group.twitter-sentiment.location}"
  resource_group_name = "${azurerm_resource_group.twitter-sentiment.name}"
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    location          = "${azurerm_resource_group.twitter-sentiment.location}"
    failover_priority = 0
  }
}