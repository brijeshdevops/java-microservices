kubectl create -f ../customers-deploy-service.yaml
TIMEOUT /T 30

kubectl get all
