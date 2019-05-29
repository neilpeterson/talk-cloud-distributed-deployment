# Talk initial setup
terraform workspace new demo-001
terraform init
terraform apply
terraform workspace new demo-002
terraform init
terraform apply

# Demo 1 - Service Catalog
## Infrastructure
kubectl get pods --all-namespaces
kubectl get apiservice
kubectl get clusterservicebroker

## Classes and Plans
kubectl get clusterserviceclasses
kubectl get clusterserviceplans
svcat get plans

## Storage Demo
kubectl create -f svcat/1-instance.yaml
kubectl get serviceinstance
kubectl create -f svcat/2-binding.yaml
kubectl get servicebinding
kubectl get secret osba-azure-storag-demo -o yaml
kubectl create -f svcat/3-application.yaml

## Helm Demo
helm repo add azure-samples https://azure-samples.github.io/helm-charts/
helm install azure-samples/osba-storage-demo
helm install azure-samples/osba-storage-demo

# Demo 2 - Terraform
export ARM_ACCESS_KEY=$(az keyvault secret show --name armAccessKeyTerraform --vault-name nepeterskv007 --query value -o tsv)
terraform workspace list
terraform workspace select demo-001
terraform destroy

# Demo 3 -  CNAB
cd cnab
duffle bundle list
duffle build .
duffle bundle list

duffle install --credentials=azure --set twitter-text=cake --set database=nepeters-cosmos-db --set database-rg=nepeters-cosmos-db --set aks-cluster=nepeters-aks-svcat --set aks-cluster-rg=nepeters-aks-svcat duffle-cake twitter-sentiment:0.1.0

duffle install --credentials=azure --set twitter-text=pizza --set database=nepeters-cosmos-db --set database-rg=nepeters-cosmos-db --set aks-cluster=nepeters-aks-svcat --set aks-cluster-rg=nepeters-aks-svcat duffle-pizza twitter-sentiment:0.1.0

duffle uninstall --credentials=azure duffle-cake
duffle uninstall --credentials=azure duffle-pizza