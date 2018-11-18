End to End:

	helm install azure-samples/twitter-sentiment -f values.yaml --set filterText=Cake

Infrastructure:

	kubectl get pods --all-namespaces
	kubectl get apiservice
	kubectl get clusterservicebroker
	kubectl describe clusterservicebroker osba

List classes / plans:

	kubectl get clusterserviceclasses
	kubectl get clusterserviceclasses -o=custom-columns=SERVICE\ NAME:.metadata.name,EXTERNAL\ NAME:.spec.externalName
	svcat get classes
	svcat get classes | grep azure-storage
	svcat get plans
	svcat get plans | grep azure-storage

Storage Demo:

	kubectl create -f 2-instance.yaml
	kubectl create -f 3-binding.yaml
	kubectl create -f 4-application.yaml

End to End:

	Go back and look at the Twitter app and related objects

CRD Demo:

	k create -f 5-tweer-factory.yaml

Notes:

	https://kubernetes.io/docs/concepts/extend-kubernetes/service-catalog/
	https://github.com/kubernetes-incubator/service-catalog
	https://github.com/operator-framework/helm-app-operator-kit