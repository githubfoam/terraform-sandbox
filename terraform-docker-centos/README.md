Vagrant Terraform Sandbox
=========


----------------

Vagrant Terraform Docker Nginx Sandbox.  
Locally running terraform all-in-one.

----------------

~~~~
Commands:

             - vagrant ssh

             cd /vagrant/terraform-docker-centos
             - sudo terraform init
             - sudo terraform plan
             - sudo terraform apply -auto-approve
             - sudo terraform show
             - sudo terraform destroy -auto-approve

             $ sudo docker image ls
 REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
 centos              latest              9f38484d220f        4 months ago        202MB


     Browse http://192.168.45.10
~~~~

License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
