# Add Git configuration
sudo git config --global user.email "mehdi.adel.achouba@gmail.com"
sudo git config --global user.name "Machoub"
# S'assure que kubectl pointe sur k3d-machoubaS
if ! kubectl config current-context >/dev/null 2>&1; then
  k3d kubeconfig merge machoubaS --kubeconfig-switch-context
fi
# create user name and root for gitlab
kubectl wait -n gitlab --for=condition=available deploy/gitlab-webservice-default --timeout=600s
GITLAB_PASS=$(sudo kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 --decode)
sudo echo "machine gitlab.k3d.gitlab.com
login root
password ${GITLAB_PASS}" > ~/.netrc
sudo rm -f /root/.netrc
sudo mv ~/.netrc /root/
sudo chmod 600 /root/.netrc