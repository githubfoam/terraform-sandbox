#!/bin/sh
# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace
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

apt-get update -qqy

sudo docker image ls

terraform init
terraform plan -out nginx.tfplan
terraform apply nginx.tfplan
terraform show
terraform destroy

sudo docker image ls

curl http://192.168.45.10
