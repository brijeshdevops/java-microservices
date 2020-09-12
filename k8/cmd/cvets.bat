kubectl create -f ../vets-deploy-service.yaml
TIMEOUT /T 30

kubectl get all
