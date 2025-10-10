# Delete namespaces then recreate it
kubectl delete namespace argocd
kubectl delete namespace dev

#install argocd
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for all argocd pods to be in running state
kubectl wait --for=condition=available --timeout=600s deployment -n argocd --all

# Get initial admin password
echo "[+] Initial admin password:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

echo "[+] ArgoCD UI URL: https://localhost:8080"
# Expose argocd server using port-forwarding
kubectl port-forward svc/argocd-server -n argocd 8080:443
echo "[+] You can login with username: admin and the above password"