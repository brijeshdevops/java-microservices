kubectl create -f ../configmap-nginx.yaml
TIMEOUT /T 7
kubectl create -f ../nginx-deploy.yaml
TIMEOUT /T 30


kubectl get all
