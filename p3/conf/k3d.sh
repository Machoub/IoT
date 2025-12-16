#first

sudo apt-get update
sudo apt-get install -qqy curl vim

echo "[+] Installing docker"
sudo apt-get install -qqy docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

echo "[+] Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "[+] Installing k3d"
sudo curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo "[+] Creating Kubernetes cluster with k3d"
newgrp docker <<EOF
k3d cluster delete machoubaS 2>/dev/null || true
k3d cluster create machoubaS
echo "[+] Listing k3d clusters"
k3d cluster list
EOF
