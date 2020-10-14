Vagrant Terraform Sandbox
=========


----------------
Cross-platform(linux/windows)  
Remote running terraform  
enabling Docker API via single/multiple port(s)  

remote control: terraformsandbox01  
target vbox: terraformsandbox03  
~~~~
multiple_sockets.conf: multiple ports
~~~~  
remote control: terraformsandbox01  

~~~~
Commands:

             > vagrant ssh terraformsandbox01
             cd /vagrant/terraformsandbox03/jenkins

             vagrant@vagrant:/vagrant/terraformsandbox03/jenkins$ sudo docker -H tcp://172.28.128.16:4142 image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

             terraform plan
             terraform apply -auto-approve

             vagrant@vagrant:/vagrant/terraformsandbox03/jenkins$ sudo docker image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             vagrant@vagrant:/vagrant/terraformsandbox03/jenkins$ sudo docker -H tcp://172.28.128.16:4142 image ls
             REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
             jenkins/jenkins     lts                 b137a5753eb1        9 days ago          567MB
             vagrant@vagrant:/vagrant/terraformsandbox03/jenkins$ sudo docker -H tcp://172.28.128.16:4142 container ls
             CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
             d0d31d6ba4f7        b137a5753eb1        "/sbin/tini -- /usr/…"   3 minutes ago       Up 2 minutes        50000/tcp, 0.0.0.0:8081->8080/tcp   jenkinsci

             terraform destroy -auto-approve             

Browse Web UI http://172.28.128.16:8081

~~~~


License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
