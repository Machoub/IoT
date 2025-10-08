Script SH

File 'hosts.sh' in conf/ folder is used to set hosts in /etc/hosts/ master VM.
Host

- vagrant up : monter les images
- vagrant destroy -f : supprimer les images
- vagrant halt : stopper l'image
- vagrant suspend : forcer l'arret

Vagrant's VM

- kubectl get nodes -o wide : retourne les pods K3S
- ifconfig eth1 : doit retourner l'ip demandee dans le sujet
- kubectl get all -n kube-system : voir si traefik a termine de build
- kubectl get all
- kubectl get pods
- kubectl get ingress
- kubectl get services
- kubectl get deployments
- kubectl logs -f <nom-du-pod-app-one>
- curl -H "Host: app1.com" http://192.168.56.110
- kubectl describe ingress ingress -n default
