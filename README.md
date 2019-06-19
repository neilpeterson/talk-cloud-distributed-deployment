# Demo 1 - Terraform
export ARM_ACCESS_KEY=$(az keyvault secret show --name armAccessKeyTerraform --vault-name nepeterskv007 --query value -o tsv)
terraform workspace list
terraform workspace select demo-001
terraform destroy

# Demo 2 - Service Catalog
## Infrastructure
kubectl get pods --all-namespaces
kubectl get apiservice
kubectl get clusterservicebroker
kubectl describe clusterservicebroker osba

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

# Demo 3 -  CNAB
porter build
porter install --param resource-prefix=porter-twitter-demo --param search-text=cake --cred twitter-sentiment
porter bundle list
porter uninstall twitter-sentiment --cred twitter-sentiment