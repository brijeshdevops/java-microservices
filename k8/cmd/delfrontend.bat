kubectl delete deploy deploy-petclinic-frontend
TIMEOUT /T 15
kubectl delete service frontend
TIMEOUT /T 15
kubectl get all
