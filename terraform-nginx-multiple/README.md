Vagrant Terraform Sandbox
=========


----------------

Vagrant Terraform Docker Nginx Sandbox.  
Locally running terraform all-in-one.

----------------

~~~~
Commands:

             - vagrant ssh

              cd /vagrant/terraform-nginx-multiple
             - sudo terraform init
             - sudo terraform plan
             - sudo terraform apply -auto-approve
             - sudo terraform show
             - sudo terraform destroy -auto-approve
             $ terraform show | grep external
                external = 32769
                external = 32768

            Browse
            http://192.168.45.10:32769/
            http://192.168.45.10:32768/

            $ sudo docker container ls
            CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                   NAMES
            566b78760244        98ebf73aba75        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        0.0.0.0:32768->80/tcp   nginx-terraform-01
            98b5431eaa20        98ebf73aba75        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        0.0.0.0:32769->80/tcp   nginx-terraform-02


     Browse http://192.168.45.10
~~~~

License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
