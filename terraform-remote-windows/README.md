Vagrant Terraform Sandbox
=========


----------------
Remote running terraform all-in-one.  
remote control: Windows Host  
target vbox: terraformsandbox02

~~~~
nginx.tf
variables.tf, variables declared  
nginx.tfvars, specify  values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json  
~~~~  
----------------
Windows Host, terraform installed.
~~~~
>systeminfo | more

OS Name:                   Microsoft Windows 10 Home Single Language
OS Version:                10.0.17134 N/A Build 17134
OS Manufacturer:           Microsoft Corporation
OS Configuration:          Standalone Workstation
OS Build Type:             Multiprocessor Free

>terraform version
Terraform v0.12.5
+ provider.docker v2.1.0

>terraform init
>terraform plan -var-file=nginx.tfvars
>terraform apply -var-file=nginx.tfvars
>terraform destroy -var-file=nginx.tfvars

>vagrant up terraformsandbox02
>vagrant ssh terraformsandbox02
>vagrant ssh-config terraformsandbox02 (nginx.tfvars inputs)
Host terraformsandbox02
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile C:/VAGRANTHOME/.vagrant/machines/terraformsandbox02/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
  >vagrant destroy -f terraformsandbox02
~~~~
vagrant vbox, Docker API over TCP enabled.
~~~~
Commands:

              >vagrant ssh terraformsandbox02
               [vagrant@localhost ~]$ sudo systemctl status docker.service
               ● docker.service - Docker Application Container Engine
                  Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
                 Drop-In: /etc/systemd/system/docker.service.d
                          └─docker.conf
                  Active: active (running) since Wed 2019-07-24 17:03:51 UTC; 15min ago
                    Docs: https://docs.docker.com
                Main PID: 5997 (dockerd)
                   Tasks: 12
                  Memory: 105.2M
                  CGroup: /system.slice/docker.service
                          └─5997 /usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock

               Jul 24 17:03:49 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:49.116402020Z" level=info msg="[graphdriver] using prior storage driver: overlay2"
               Jul 24 17:03:49 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:49.221015489Z" level=info msg="Loading containers: start."
               Jul 24 17:03:49 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:49.587775400Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --b...d IP address"
               Jul 24 17:03:49 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:49.625687758Z" level=info msg="Loading containers: done."
               Jul 24 17:03:51 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:51.367500483Z" level=info msg="Docker daemon" commit=aeac9490dc graphdriver(s)=overlay2 version=19.03.0
               Jul 24 17:03:51 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:51.367579559Z" level=info msg="Daemon has completed initialization"
               Jul 24 17:03:51 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:51.465993008Z" level=info msg="API listen on var/run/docker.sock"
               Jul 24 17:03:51 localhost.localdomain systemd[1]: Started Docker Application Container Engine.
               Jul 24 17:03:51 localhost.localdomain dockerd[5997]: time="2019-07-24T17:03:51.528779058Z" level=info msg="API listen on [::]:2375"
               Jul 24 17:09:40 localhost.localdomain dockerd[5997]: time="2019-07-24T17:09:40.511528811Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
               Hint: Some lines were ellipsized, use -l to show in full.              
~~~~

eth1 (nginx.tfvars inputs)
~~~~
Commands:

>vagrant ssh terraformsandbox02
[vagrant@localhost ~]$ ifconfig
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet6 fe80::42:62ff:fe35:f034  prefixlen 64  scopeid 0x20<link>
        ether 02:42:62:35:f0:34  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8  bytes 656 (656.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::382f:69a0:f2a0:63dc  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:df:b1:7a  txqueuelen 1000  (Ethernet)
        RX packets 160439  bytes 180374470 (172.0 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 45191  bytes 2894125 (2.7 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.28.128.15  netmask 255.255.255.0  broadcast 172.28.128.255
        inet6 fe80::a00:27ff:fe78:f6e5  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:78:f6:e5  txqueuelen 1000  (Ethernet)
        RX packets 197  bytes 17779 (17.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 226  bytes 66473 (64.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 16  bytes 1312 (1.2 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 16  bytes 1312 (1.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0     
~~~~

License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
