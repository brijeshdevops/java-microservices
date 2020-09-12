kubectl delete deployment.apps/nginx-ingress-controller --namespace=ingress-nginx
TIMEOUT /T 5
kubectl delete configmaps nginx-configuration
TIMEOUT /T 5
kubectl delete configmaps tcp-services
TIMEOUT /T 5
kubectl delete configmaps udp-services
TIMEOUT /T 5
kubectl delete serviceaccounts nginx-ingress-serviceaccount
TIMEOUT /T 5
kubectl delete clusterroles.rbac.authorization.k8s.io nginx-ingress-clusterrole
TIMEOUT /T 5
kubectl delete roles.rbac.authorization.k8s.io nginx-ingress-role
TIMEOUT /T 5
kubectl delete rolebindings.rbac.authorization.k8s.io nginx-ingress-role-nisa-binding
TIMEOUT /T 5
kubectl delete clusterrolebindings.rbac.authorization.k8s.io nginx-ingress-clusterrole-nisa-binding
TIMEOUT /T 5
kubectl delete namespaces ingress-nginx
TIMEOUT /T 5

