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
Without enabling docker API, redirecting TCP traffic to unix socket with socat.
~~~~
Commands:

              >vagrant ssh terraformsandbox02
              $ sudo yum install -y socat
              $ sudo socat TCP-LISTEN:2375,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock
              $ netstat -ltn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:2375            0.0.0.0:*               LISTEN
              $ sudo docker container ls
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
91f5dce7204e        e445ab08b2be        "nginx -g 'daemon of…"   4 minutes ago       Up 4 minutes        0.0.0.0:80->80/tcp   nginx-server
[vagrant@localhost ~]$ sudo systemctl status docker.service
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Wed 2019-07-24 21:37:03 UTC; 25min ago
     Docs: https://docs.docker.com
 Main PID: 5617 (dockerd)
    Tasks: 17
   Memory: 142.2M
   CGroup: /system.slice/docker.service
           ├─5617 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
           └─6150 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 80 -container-ip 172.17.0.2 -container-port 80

Jul 24 21:36:57 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:57.249496844Z" level=info msg="ClientConn switching balancer to \"pick_first\"" module=grpc
Jul 24 21:36:57 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:57.249541239Z" level=info msg="pickfirstBalancer: HandleSubConnStateChange: 0xc0006a4740, CONNECTING" module=grpc
Jul 24 21:36:57 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:57.249767692Z" level=info msg="pickfirstBalancer: HandleSubConnStateChange: 0xc0006a4740, READY" module=grpc
Jul 24 21:36:57 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:57.284152479Z" level=info msg="Loading containers: start."
Jul 24 21:36:58 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:58.207939480Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --b...d IP address"
Jul 24 21:36:58 localhost.localdomain dockerd[5617]: time="2019-07-24T21:36:58.414453042Z" level=info msg="Loading containers: done."
Jul 24 21:37:02 localhost.localdomain dockerd[5617]: time="2019-07-24T21:37:02.747111858Z" level=info msg="Docker daemon" commit=aeac9490dc graphdriver(s)=overlay2 version=19.03.0
Jul 24 21:37:02 localhost.localdomain dockerd[5617]: time="2019-07-24T21:37:02.747686741Z" level=info msg="Daemon has completed initialization"
Jul 24 21:37:03 localhost.localdomain dockerd[5617]: time="2019-07-24T21:37:03.464917304Z" level=info msg="API listen on /var/run/docker.sock"
Jul 24 21:37:03 localhost.localdomain systemd[1]: Started Docker Application Container Engine.
~~~~


License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
