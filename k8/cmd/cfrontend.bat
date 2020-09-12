kubectl create -f ../frontend-deploy-service.yaml
TIMEOUT /T 20
kubectl get all
