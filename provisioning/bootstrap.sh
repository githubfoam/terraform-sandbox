#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

  echo "===================================================================================="
                        uname -a
  echo "===================================================================================="
  echo "         \   ^__^                                                                  "
  echo "          \  (oo)\_______                                                          "
  echo "             (__)\       )\/\                                                      "
  echo "                 ||----w |                                                         "
  echo "                 ||     ||                                                         "
  echo "===================================================================================="

echo "=================================# # Install Docker==================================================="

# https://docs.docker.com/engine/install/ubuntu/

# dpkg-preconfigure: unable to re-open stdin: No such file or directory
export DEBIAN_FRONTEND=noninteractive

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install -qqy apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -qqy
docker --version

echo "==================================# Install Terraform=================================================="

# https://learn.hashicorp.com/tutorials/terraform/install-cli
# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# Add the official HashiCorp Linux repository.
apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install terraform -qyy
terraform -help
terraform -install-autocomplete 

echo "=============================Deploy nginx======================================================="

docker image ls
terraform init
terraform plan -out nginx.tfplan
terraform apply nginx.tfplan
terraform show
terraform destroy

sudo docker image ls

curl http://192.168.45.10