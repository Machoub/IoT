#3

BOLD="\033[1m"
ITALIC="\033[3m"
RESET="\033[0m"

# Apply argocd manifests
kubectl apply -f /home/debian/IoT/p3/deploy/argo_CD_deploy.yaml

# Write command
echo -n "\n${BOLD}Command to start wil-app:${RESET}\n"
echo -n "\t kubectl port-forward svc/wil-app -n dev 8888:8080\n"
echo -n "Then visit ${ITALIC}http://localhost:8085${RESET}\n"