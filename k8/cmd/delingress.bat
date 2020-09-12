kubectl delete deploy nginx-ingress-controller
TIMEOUT /T 15
kubectl delete service nginx-ingress
TIMEOUT /T 10
kubectl delete ingress ingress-petclinic
TIMEOUT /T 10
kubectl delete configmap configmap-nginx
TIMEOUT /T 5

kubectl get all
