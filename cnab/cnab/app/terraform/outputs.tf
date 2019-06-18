output "ANALYTICS-FQDN" {
  value = "${azurerm_cognitive_account.twitter-sentiment.endpoint}"
}

output "ANALYTICS-KEY" {
  value = "${azurerm_cognitive_account.twitter-sentiment.primary_access_key}"
}

output "AZURE_STORAGE_ACCT" {
  value = "${azurerm_storage_account.twitter-sentiment.name}"
}

output "AZURE_QUEUE_KEY" {
  value = "${azurerm_storage_account.twitter-sentiment.primary_access_key}"
}

output "AZURE_COSMOS_HOST" {
  value = "${azurerm_cosmosdb_account.twitter-sentiment.endpoint}"
}

output "AZURE_COSMOS_KEY" {
  value = "${azurerm_cosmosdb_account.twitter-sentiment.primary_master_key}"
}