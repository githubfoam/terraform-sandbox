Vagrant Terraform Sandbox
=========


----------------
Cross-platform(linux/win)  
Remote running terraform  
remote control: terraformsandbox01

~~~~
nginx.tf
variables.tf, variables declared  
nginx.tfvars, specify  values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json  
~~~~  
remote control: terraformsandbox01
~~~~
Commands:

             > vagrant ssh terraformsandbox01

             $  cd /vagrant
             $  sudo docker -H tcp://172.28.128.15:2375 ps
             $  terraform init
             $  terraform plan -var-file=nginx.tfvars
             $  sudo terraform apply -var-file=nginx.tfvars -auto-approve
             $  sudo terraform show
             $ sudo docker -H tcp://172.28.128.15:2375 container ls
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
52b572d3cdcd        e445ab08b2be        "nginx -g 'daemon of…"   9 minutes ago       Up 9 minutes        0.0.0.0:80->80/tcp   nginx-server

vagrant@vagrant:/vagrant$ export DOCKER_HOST="tcp://172.28.128.15:4141"
vagrant@vagrant:/vagrant$ echo $DOCKER_HOST
tcp://172.28.128.15:4141
vagrant@vagrant:/vagrant$ sudo docker -H $DOCKER_HOST ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
6e5559c69314        e445ab08b2be        "nginx -g 'daemon of…"   35 minutes ago      Up 35 minutes       0.0.0.0:80->80/tcp   nginx-server


             - $  sudo terraform destroy -var-file=nginx.tfvars -auto-approve

~~~~
----------------
target vbox: terraformsandbox02
~~~~
Commands:

              >vagrant ssh terraformsandbox02
              [vagrant@localhost ~]$ sudo systemctl status docker.service -l
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
  Drop-In: /etc/systemd/system/docker.service.d
           └─docker.conf
   Active: active (running) since Thu 2019-07-25 08:47:15 UTC; 35min ago
     Docs: https://docs.docker.com
 Main PID: 6263 (dockerd)
    Tasks: 17
   Memory: 158.3M
   CGroup: /system.slice/docker.service
           ├─6263 /usr/bin/dockerd -H tcp://0.0.0.0:4141 -H unix://var/run/docker.sock
           └─6449 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 80 -container-ip 172.17.0.2 -container-port 80

Jul 25 08:47:14 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:14.008013882Z" level=info msg="pickfirstBalancer: HandleSubConnStateChange: 0xc000632c30, READY" module=grpc
Jul 25 08:47:14 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:14.245359337Z" level=info msg="[graphdriver] using prior storage driver: overlay2"
Jul 25 08:47:14 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:14.299129488Z" level=info msg="Loading containers: start."
Jul 25 08:47:14 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:14.566323473Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP address"
Jul 25 08:47:14 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:14.604234925Z" level=info msg="Loading containers: done."
Jul 25 08:47:15 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:15.575901889Z" level=info msg="Docker daemon" commit=aeac9490dc graphdriver(s)=overlay2 version=19.03.0
Jul 25 08:47:15 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:15.576000673Z" level=info msg="Daemon has completed initialization"
Jul 25 08:47:15 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:15.737544634Z" level=info msg="API listen on var/run/docker.sock"
Jul 25 08:47:15 localhost.localdomain dockerd[6263]: time="2019-07-25T08:47:15.737650139Z" level=info msg="API listen on [::]:4141"
Jul 25 08:47:15 localhost.localdomain systemd[1]: Started Docker Application Container Engine.

~~~~


License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
