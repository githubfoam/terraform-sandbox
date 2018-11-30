# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<SCRIPT
# Install Docker
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get install docker-ce -y
docker --version
# Install Terraform
sudo apt-get install unzip -y
sudo wget -q https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
sudo unzip terraform_0.11.10_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo terraform version
# Run terraform templates
cd /vagrant
sudo terraform init
sudo terraform plan -out nginx.tfplan
sudo terraform apply "nginx.tfplan"
sudo docker ps -a
# sudo terraform destroy
SCRIPT
Vagrant.configure(2) do |config|
  config.vm.box_check_update = false
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "terraform-sandbox"
  config.vm.network "private_network", ip: "192.168.45.10"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.name = "terraform-sandbox"
    vb.memory = "1024"
    vb.cpus = 1
  end
  config.vm.provision "shell", inline: $script, privileged: false
end
