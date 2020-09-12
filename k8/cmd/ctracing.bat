kubectl create -f ../tracing-deploy-service.yaml
TIMEOUT /T 30

kubectl get all
