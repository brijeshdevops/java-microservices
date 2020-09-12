kubectl create -f ../config-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../discovery-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../frontend-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../customers-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../visits-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../vets-deploy-service.yaml
TIMEOUT /T 30
kubectl create -f ../tracing-deploy-service.yaml
TIMEOUT /T 30

kubectl get all

