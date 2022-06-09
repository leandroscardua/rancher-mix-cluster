sudo apt-get update && sudo apt upgrade -y && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Enable netfilter 
sudo modprobe br_netfilter

# Disable swap 
sudo swapoff -a

# Enables IP Forward 
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo sysctl --system

# Install docker 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update && apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}

# change cggroup to systemd
cat <<EOF > /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
sudo systemctl daemon-reload && systemctl restart docker

# Run Rancher Single Node.

docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged -e CATTLE_BOOTSTRAP_PASSWORD={{ enter ps here }} rancher/rancher:latest
