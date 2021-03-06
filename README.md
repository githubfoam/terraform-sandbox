terraform sandbox  

Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/terraform-sandbox.svg?branch=master)](https://travis-ci.com/githubfoam/terraform-sandbox)  

feature windows
[![Build Status](https://travis-ci.com/githubfoam/terraform-sandbox.svg?branch=feature_windows)](https://travis-ci.com/githubfoam/terraform-sandbox)

feature macos
[![Build Status](https://travis-ci.com/githubfoam/terraform-sandbox.svg?branch=feature_macos)](https://travis-ci.com/githubfoam/terraform-sandbox)

----------------
Cross-platform (linux/win/macos)  
Vagrant Terraform Docker Nginx Sandbox.  

~~~~

>vagrant init --template Vagrantfile.terraform.erb
>vagrant up terraformsandbox01
>vagrant ssh terraformsandbox01

Commands:

             - vagrant ssh

             cd /vagrant
             - sudo terraform init
             - sudo terraform plan -out nginx.tfplan
             - sudo terraform apply nginx.tfplan
             - sudo terraform show
             - sudo terraform destroy

             $ sudo docker image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             nginx               latest              98ebf73aba75        4 days ago          109MB
             $ sudo docker container ls
             CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                NAMES
             7cdc5352bdaf        98ebf73aba75        "nginx -g 'daemon of…"   About a minute ago   Up About a minute   0.0.0.0:80->80/tcp   nginx-server                          
             $ sudo docker exec -it 7cdc5352bdaf bash
             root@7cdc5352bdaf:/#


     Browse http://192.168.45.10
~~~~

~~~~
https://learn.hashicorp.com/tutorials/terraform/install-cli
----------------
~~~~

License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
