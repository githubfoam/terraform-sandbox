# https://www.terraform.io/docs/configuration/variables.html
# To set lots of variables, it is more convenient to specify their values in a variable
# definitions file (with a filename ending in either .tfvars or .tfvars.json) and
# then specify that file on the command line with -var-file:
docker_host_ip = "172.28.128.15"
ssh_host = "127.0.0.1"
ssh_port = "2222"
ssh_user = "vagrant"
ssh_key = ".vagrant/machines/terraformsandbox02/virtualbox/private_key"
