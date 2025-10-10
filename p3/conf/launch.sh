BOLD="\033[1m"
ITALIC="\033[3m"
RESET="\033[0m"

kubectl apply -f /home/debian/IoT/p3/deploy/argo_CD_deploy.yaml

# Write command
echo -n "\n${BOLD}Command to start wil-app:${RESET}\n"
echo -n "\t kubectl port-forward svc/svc-wil -n dev 8888:8080\n"
echo -n "Then visit ${ITALIC}http://localhost:8888${RESET}\n"