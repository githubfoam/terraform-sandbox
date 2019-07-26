Vagrant Terraform Sandbox
=========


----------------
Cross-platform(linux/windows)  
Remote running terraform  
enabling Docker API via single/multiple port(s)  

remote control: terraformsandbox01  
target vbox: terraformsandbox02  
target vbox: terraformsandbox03  
~~~~
docker.conf: single port
multiple_sockets.conf: multiple ports
~~~~  
remote control: terraformsandbox01  

~~~~
Commands:

             > vagrant ssh terraformsandbox01
             cd /vagrant/terraformsandbox02/nginx

             vagrant@vagrant:/vagrant/terraformsandbox02/nginx$ sudo docker image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             vagrant@vagrant:/vagrant/terraformsandbox02/nginx$ sudo docker -H tcp://172.28.128.15:2375 image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

             terraform plan
             terraform apply -auto-approve

             vagrant@vagrant:/vagrant/terraformsandbox02/nginx$ sudo docker image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             vagrant@vagrant:/vagrant/terraformsandbox02/nginx$ sudo docker -H tcp://172.28.128.15:2375 image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             nginx               latest              e445ab08b2be        2 days ago          126MB             
             vagrant@vagrant:/vagrant/terraformsandbox02/nginx$ sudo docker -H tcp://172.28.128.15:2375 container ls
             CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
             b1eebb131a62        e445ab08b2be        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        0.0.0.0:84->80/tcp   nginx-proxy2

             terraform destroy -auto-approve             


~~~~
----------------
target vbox: terraformsandbox02  

~~~~
Commands:
             > vagrant ssh terraformsandbox02  

             [vagrant@localhost ~]$ sudo docker image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             nginx               latest              e445ab08b2be        2 days ago          126MB
             [vagrant@localhost ~]$ sudo docker container ls
             CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
             b1eebb131a62        e445ab08b2be        "nginx -g 'daemon of…"   4 minutes ago       Up 3 minutes        0.0.0.0:84->80/tcp   nginx-proxy2

Browse Web UI http://172.28.128.15:84/
~~~~


License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
