Vagrant Terraform Sandbox
=========


----------------

Vagrant Terraform Docker Nginx Sandbox.  
Locally running terraform all-in-one.

----------------

~~~~
Commands:

             - vagrant ssh

             cd /vagrant/terraform-docker-ubuntu
             - sudo terraform init
             - sudo terraform plan
             - sudo terraform apply -auto-approve
             - sudo terraform show
             - sudo terraform destroy -auto-approve

            $ sudo docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              4c108a37151f        4 weeks ago         64.2MB


     Browse http://192.168.45.10
~~~~

License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
