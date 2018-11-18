# AKS
verify cluster and svcat get classes

# Minikube
minikube start

# Helm config (RBAC)
kubectl create -f https://raw.githubusercontent.com/Azure/helm-charts/master/docs/prerequisities/helm-rbac-config.yaml
helm init --service-account tiller

# Service catalog config
helm repo add svc-cat https://svc-catalog-charts.storage.googleapis.com
helm install svc-cat/catalog --name catalog --namespace catalog --set controllerManager.healthcheck.enabled=false

# Azure info
AZURE_SUBSCRIPTION_ID=$(az keyvault secret show --name AzureSubscriptionID --vault-name billBooth --query value -o tsv)
AZURE_CLIENT_ID=$(az keyvault secret show --name AzureClientID --vault-name billBooth --query value -o tsv)
AZURE_CLIENT_SECRET=$(az keyvault secret show --name AzureClientSecret --vault-name billBooth --query value -o tsv)
AZURE_TENANT_ID=$(az keyvault secret show --name AzureTenantID --vault-name billBooth --query value -o tsv)

# Install OSBA proper
helm repo add azure https://kubernetescharts.blob.core.windows.net/azure
helm install azure/open-service-broker-azure --name osba --namespace osba \
  --set azure.subscriptionId=$AZURE_SUBSCRIPTION_ID \
  --set azure.tenantId=$AZURE_TENANT_ID \
  --set azure.clientId=$AZURE_CLIENT_ID \
  --set azure.clientSecret=$AZURE_CLIENT_SECRET \
  --set modules.minStability=experimental

# Pre-pull images
minikube ssh
docker pull neilpeterson/osba-storage-demo