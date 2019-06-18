variable "resource_group" {
  description = "The name of the resource group in which to create the container instance and Cosmos DB instance."
  default     = "hello-world-two"
}

variable "location" {
  description = "The location for the resource group in which to create the container instance and Cosmos DB instance."
  default     = "westus"
}

variable "resource-prefix" {
  description = "Prefix for all Azure resources."
  default     = "tweetsentiment"
}


variable "failover_location" {
  description = "Failover location for the Azure Cosmos DB."
  default     = "westus2"
}

variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}