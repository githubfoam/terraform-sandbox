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
             $  sudo terraform apply -var-file=nginx.tfvars
             $  sudo terraform show
             $ sudo docker -H tcp://172.28.128.15:2375 container ls
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
52b572d3cdcd        e445ab08b2be        "nginx -g 'daemon of…"   9 minutes ago       Up 9 minutes        0.0.0.0:80->80/tcp   nginx-server
             - $  sudo terraform destroy -var-file=nginx.tfvars

~~~~
----------------
target vbox: terraformsandbox02
~~~~
Commands:

              >vagrant ssh terraformsandbox02
              [vagrant@localhost ~]$ sudo systemctl status docker.service
● docker.service - Docker Application Container Engine
  Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
 Drop-In: /etc/systemd/system/docker.service.d
          └─docker.conf
  Active: active (running) since Wed 2019-07-24 18:33:37 UTC; 2h 1min ago
    Docs: https://docs.docker.com
Main PID: 5981 (dockerd)
   Tasks: 10
  Memory: 83.7M
  CGroup: /system.slice/docker.service
          └─5981 /usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock

Jul 24 18:33:34 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:34.194653959Z" level=info msg="pickfirstBalancer: HandleSubConnStateChange: 0xc000636970, READY" module=grpc
Jul 24 18:33:34 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:34.421281480Z" level=info msg="[graphdriver] using prior storage driver: overlay2"
Jul 24 18:33:34 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:34.715902065Z" level=info msg="Loading containers: start."
Jul 24 18:33:35 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:35.046695826Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --b...d IP address"
Jul 24 18:33:35 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:35.100512002Z" level=info msg="Loading containers: done."
Jul 24 18:33:37 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:37.448629564Z" level=info msg="Docker daemon" commit=aeac9490dc graphdriver(s)=overlay2 version=19.03.0
Jul 24 18:33:37 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:37.448729556Z" level=info msg="Daemon has completed initialization"
Jul 24 18:33:37 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:37.744045788Z" level=info msg="API listen on var/run/docker.sock"
Jul 24 18:33:37 localhost.localdomain dockerd[5981]: time="2019-07-24T18:33:37.744164475Z" level=info msg="API listen on [::]:2375"
Jul 24 18:33:37 localhost.localdomain systemd[1]: Started Docker Application Container Engine

~~~~


License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
