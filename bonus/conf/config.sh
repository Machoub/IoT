sudo apt-get -yqq install git

# Helm si absent
if ! command -v helm >/dev/null 2>&1; then
  echo "[+] Installing Helm 3"
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

kubectl delete namespace gitlab
kubectl create namespace gitlab

# Install GitLab using Helm
helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
  --namespace gitlab \
  -f https://gitlab.com/gitlab-org/charts/gitlab/raw/master/examples/values-minikube-minimum.yaml \
  --set global.hosts.externalIP=0.0.0.0 \
  --set global.hosts.https=false \
  --timeout 600s

# Wait for all GitLab pods to be in running state
kubectl wait --for=condition=available --timeout=600s deployment -n gitlab --all

# Get initial root password
echo "[+] Initial GitLab root password:"
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 -d; echo

echo "[+] GitLab URL: http://localhost:8081"
# Expose GitLab using port-forwarding
kubectl port-forward svc/gitlab-webservice-default -n gitlab 8081:8080
echo "[+] You can login with username: root and the above password"F