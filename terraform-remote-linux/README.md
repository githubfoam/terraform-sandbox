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

             vagrant@vagrant:~$ hostnamectl
             Static hostname: vagrant
                   Icon name: computer-vm
                     Chassis: vm
                  Machine ID: a9a80233920248ec8899ea11f2b917b4
                     Boot ID: 11dd8671f8b14cc49ad229d0f67192a3
              Virtualization: oracle
            Operating System: Ubuntu 18.10
                      Kernel: Linux 4.18.0-10-generic
                Architecture: x86-64

                vagrant@vagrant:~$ ifconfig
                docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
                        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
                        ether 02:42:0d:08:ca:28  txqueuelen 0  (Ethernet)
                        RX packets 0  bytes 0 (0.0 B)
                        RX errors 0  dropped 0  overruns 0  frame 0
                        TX packets 0  bytes 0 (0.0 B)
                        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
                        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
                        inet6 fe80::a00:27ff:fed7:2363  prefixlen 64  scopeid 0x20<link>
                        ether 08:00:27:d7:23:63  txqueuelen 1000  (Ethernet)
                        RX packets 123032  bytes 141342381 (141.3 MB)
                        RX errors 0  dropped 0  overruns 0  frame 0
                        TX packets 30158  bytes 2605644 (2.6 MB)
                        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
                        inet 172.28.128.12  netmask 255.255.255.0  broadcast 172.28.128.255
                        inet6 fe80::a00:27ff:fe0d:c2a1  prefixlen 64  scopeid 0x20<link>
                        ether 08:00:27:0d:c2:a1  txqueuelen 1000  (Ethernet)
                        RX packets 5371  bytes 1429298 (1.4 MB)
                        RX errors 0  dropped 0  overruns 0  frame 0
                        TX packets 5222  bytes 408458 (408.4 KB)
                        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
                        inet 127.0.0.1  netmask 255.0.0.0
                        inet6 ::1  prefixlen 128  scopeid 0x10<host>
                        loop  txqueuelen 1000  (Local Loopback)
                        RX packets 400  bytes 48088 (48.0 KB)
                        RX errors 0  dropped 0  overruns 0  frame 0
                        TX packets 400  bytes 48088 (48.0 KB)
                        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0   

             vagrant@vagrant:~$ sudo docker version
             Client: Docker Engine - Community
              Version:           19.03.1
              API version:       1.40
              Go version:        go1.12.5
              Git commit:        74b1e89
              Built:             Thu Jul 25 21:21:24 2019
              OS/Arch:           linux/amd64
              Experimental:      false

             Server: Docker Engine - Community
              Engine:
               Version:          19.03.1
               API version:      1.40 (minimum version 1.12)
               Go version:       go1.12.5
               Git commit:       74b1e89
               Built:            Thu Jul 25 21:19:54 2019
               OS/Arch:          linux/amd64
               Experimental:     false
              containerd:
               Version:          1.2.6
               GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
              runc:
               Version:          1.0.0-rc8
               GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
              docker-init:
               Version:          0.18.0
               GitCommit:        fec3683

               vagrant@vagrant:~$ terraform version
               Terraform v0.12.5     

               vagrant@vagrant:~$ sudo docker -H tcp://172.28.128.15:2375 image ls
               REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

               vagrant@vagrant:~$ export DOCKER_HOST_terraform02=tcp://172.28.128.15:2375
               vagrant@vagrant:~$ sudo docker -H $DOCKER_HOST_terraform02 image ls
               REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

               vagrant@vagrant:~$ sudo docker -H $DOCKER_HOST_terraform02 ps
               CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

               vagrant@vagrant:~$ sudo docker -H $DOCKER_HOST_terraform02 container ls
               CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

               vagrant@vagrant:~$ curl http://172.28.128.15:2375/version
               {"Platform":{"Name":"Docker Engine - Community"},"Components":[{"Name":"Engine","Version":"19.03.1","Details":{"ApiVersion":"1.40","Arch":"amd64","BuildTime":"2019-07-25T21:19:36.000000000+00:00","Experimental":"false","GitCommit":"74b1e89","GoVersion":"go1.12.5","KernelVersion":"3.10.0-957.1.3.el7.x86_64","MinAPIVersion":"1.12","Os":"linux"}},{"Name":"containerd","Version":"1.2.6","Details":{"GitCommit":"894b81a4b802e4eb2a91d1ce216b8817763c29fb"}},{"Name":"runc","Version":"1.0.0-rc8","Details":{"GitCommit":"425e105d5a03fabd737a126ad93d62a9eeede87f"}},{"Name":"docker-init","Version":"0.18.0","Details":{"GitCommit":"fec3683"}}],"Version":"19.03.1","ApiVersion":"1.40","MinAPIVersion":"1.12","GitCommit":"74b1e89","GoVersion":"go1.12.5","Os":"linux","Arch":"amd64","KernelVersion":"3.10.0-957.1.3.el7.x86_64","BuildTime":"2019-07-25T21:19:36.000000000+00:00"}

               vagrant@vagrant:~$ curl -X GET http://172.28.128.15:2375/images/json
               []

               vagrant@vagrant:~$ export DOCKER_HOST_terraform03_P1=tcp://172.28.128.16:4141
               vagrant@vagrant:~$ sudo docker -H $DOCKER_HOST_terraform03_P1 ps
               CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
               0b15096d1dbd        2b4ddf654e1c        "/portainer"             About an hour ago   Up 4 minutes        0.0.0.0:9000->9000/tcp              portainer
               620ed42d3040        b137a5753eb1        "/sbin/tini -- /usr/…"   3 hours ago         Up 3 hours          50000/tcp, 0.0.0.0:8081->8080/tcp   jenkinsci

               vagrant@vagrant:~$ export DOCKER_HOST_terraform03_P2=tcp://172.28.128.16:4142
               vagrant@vagrant:~$ sudo docker -H $DOCKER_HOST_terraform03_P2 ps
               CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
               0b15096d1dbd        2b4ddf654e1c        "/portainer"             About an hour ago   Up 30 seconds       0.0.0.0:9000->9000/tcp              portainer
               620ed42d3040        b137a5753eb1        "/sbin/tini -- /usr/…"   3 hours ago         Up 3 hours          50000/tcp, 0.0.0.0:8081->8080/tcp   jenkinsci

               vagrant@vagrant:~$ curl -X GET http://172.28.128.16:4141/images/json
               [{"Containers":-1,"Created":1564107108,"Id":"sha256:2b4ddf654e1c413b21c7253125aa0f34a4ff74154558940fa689f8754ec853c5","Labels":null,"ParentId":"","RepoDigests":["portainer/portainer@sha256:7de89d243c098ed633a57623ee0c16de6bfb0cd13243afd11cf533a21cc5436a"],"RepoTags":["portainer/portainer:latest"],"SharedSize":-1,"Size":77680455,"VirtualSize":77680455},{"Containers":-1,"Created":1563895273,"Id":"sha256:3556258649b2ef23a41812be17377d32f568ed9f45150a26466d2ea26d926c32","Labels":null,"ParentId":"","RepoDigests":["ubuntu@sha256:c303f19cfe9ee92badbbbd7567bc1ca47789f79303ddcef56f77687d4744cd7a"],"RepoTags":["ubuntu:latest"],"SharedSize":-1,"Size":64185514,"VirtualSize":64185514},{"Containers":-1,"Created":1563370417,"Id":"sha256:b137a5753eb1adb07175ba3b3ebf808db2130f818ca5f3953b2caf87e9fbd147","Labels":null,"ParentId":"","RepoDigests":["jenkins/jenkins@sha256:5a1ac8381051dc430dcc90077f648ed1e1b91149b5808a8dea507639eefc563f"],"RepoTags":["jenkins/jenkins:lts"],"SharedSize":-1,"Size":567041724,"VirtualSize":567041724}]

               vagrant@vagrant:~$ curl -X GET http://172.28.128.16:4142/images/json
               [{"Containers":-1,"Created":1564107108,"Id":"sha256:2b4ddf654e1c413b21c7253125aa0f34a4ff74154558940fa689f8754ec853c5","Labels":null,"ParentId":"","RepoDigests":["portainer/portainer@sha256:7de89d243c098ed633a57623ee0c16de6bfb0cd13243afd11cf533a21cc5436a"],"RepoTags":["portainer/portainer:latest"],"SharedSize":-1,"Size":77680455,"VirtualSize":77680455},{"Containers":-1,"Created":1563895273,"Id":"sha256:3556258649b2ef23a41812be17377d32f568ed9f45150a26466d2ea26d926c32","Labels":null,"ParentId":"","RepoDigests":["ubuntu@sha256:c303f19cfe9ee92badbbbd7567bc1ca47789f79303ddcef56f77687d4744cd7a"],"RepoTags":["ubuntu:latest"],"SharedSize":-1,"Size":64185514,"VirtualSize":64185514},{"Containers":-1,"Created":1563370417,"Id":"sha256:b137a5753eb1adb07175ba3b3ebf808db2130f818ca5f3953b2caf87e9fbd147","Labels":null,"ParentId":"","RepoDigests":["jenkins/jenkins@sha256:5a1ac8381051dc430dcc90077f648ed1e1b91149b5808a8dea507639eefc563f"],"RepoTags":["jenkins/jenkins:lts"],"SharedSize":-1,"Size":567041724,"VirtualSize":567041724}                                             


~~~~
----------------
target vbox: terraformsandbox02  

~~~~
Commands:

              >vagrant ssh terraformsandbox02
              [vagrant@localhost ~]$ hostnamectl
                 Static hostname: localhost.localdomain
                       Icon name: computer-vm
                         Chassis: vm
                      Machine ID: cfa0388701ff415dbceb1d083ec3fdfd
                         Boot ID: f94a30345e6441089f19b9829d593f04
                  Virtualization: kvm
                Operating System: CentOS Linux 7 (Core)
                     CPE OS Name: cpe:/o:centos:centos:7
                          Kernel: Linux 3.10.0-957.1.3.el7.x86_64
                    Architecture: x86-64

                    [vagrant@localhost ~]$ ifconfig
                    docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
                            inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
                            ether 02:42:91:42:a4:56  txqueuelen 0  (Ethernet)
                            RX packets 0  bytes 0 (0.0 B)
                            RX errors 0  dropped 0  overruns 0  frame 0
                            TX packets 0  bytes 0 (0.0 B)
                            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                    eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
                            inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
                            inet6 fe80::4cc0:9a08:d805:bd13  prefixlen 64  scopeid 0x20<link>
                            ether 08:00:27:df:b1:7a  txqueuelen 1000  (Ethernet)
                            RX packets 112737  bytes 127012130 (121.1 MiB)
                            RX errors 0  dropped 0  overruns 0  frame 0
                            TX packets 32185  bytes 2079384 (1.9 MiB)
                            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                    eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
                            inet 172.28.128.15  netmask 255.255.255.0  broadcast 172.28.128.255
                            inet6 fe80::a00:27ff:fe8e:2880  prefixlen 64  scopeid 0x20<link>
                            ether 08:00:27:8e:28:80  txqueuelen 1000  (Ethernet)
                            RX packets 2  bytes 1180 (1.1 KiB)
                            RX errors 0  dropped 0  overruns 0  frame 0
                            TX packets 15  bytes 1796 (1.7 KiB)
                            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
                            inet 127.0.0.1  netmask 255.0.0.0
                            inet6 ::1  prefixlen 128  scopeid 0x10<host>
                            loop  txqueuelen 1000  (Local Loopback)
                            RX packets 12  bytes 984 (984.0 B)
                            RX errors 0  dropped 0  overruns 0  frame 0
                            TX packets 12  bytes 984 (984.0 B)
                            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

                    [vagrant@localhost ~]$ sudo docker version
                    Client: Docker Engine - Community
                     Version:           19.03.1
                     API version:       1.40
                     Go version:        go1.12.5
                     Git commit:        74b1e89
                     Built:             Thu Jul 25 21:21:07 2019
                     OS/Arch:           linux/amd64
                     Experimental:      false

                    Server: Docker Engine - Community
                     Engine:
                      Version:          19.03.1
                      API version:      1.40 (minimum version 1.12)
                      Go version:       go1.12.5
                      Git commit:       74b1e89
                      Built:            Thu Jul 25 21:19:36 2019
                      OS/Arch:          linux/amd64
                      Experimental:     false
                     containerd:
                      Version:          1.2.6
                      GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
                     runc:
                      Version:          1.0.0-rc8
                      GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
                     docker-init:
                      Version:          0.18.0
                      GitCommit:        fec3683

                      [vagrant@localhost ~]$ sudo systemctl status docker.service -l
                      ● docker.service - Docker Application Container Engine
                         Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
                        Drop-In: /etc/systemd/system/docker.service.d
                                 └─docker.conf
                         Active: active (running) since Fri 2019-07-26 10:52:00 UTC; 7min ago
                           Docs: https://docs.docker.com
                       Main PID: 5983 (dockerd)
                          Tasks: 10
                         Memory: 64.4M
                         CGroup: /system.slice/docker.service
                                 └─5983 /usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375

                      Jul 26 10:51:58 localhost.localdomain dockerd[5983]: time="2019-07-26T10:51:58.487044207Z" level=info msg="pickfirstBalancer: HandleSubConnStateChange: 0xc0007a4880, READY" module=grpc
                      Jul 26 10:51:58 localhost.localdomain dockerd[5983]: time="2019-07-26T10:51:58.578101392Z" level=info msg="[graphdriver] using prior storage driver: overlay2"
                      Jul 26 10:51:58 localhost.localdomain dockerd[5983]: time="2019-07-26T10:51:58.711134345Z" level=info msg="Loading containers: start."
                      Jul 26 10:51:59 localhost.localdomain dockerd[5983]: time="2019-07-26T10:51:59.180214509Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP address"
                      Jul 26 10:51:59 localhost.localdomain dockerd[5983]: time="2019-07-26T10:51:59.227859271Z" level=info msg="Loading containers: done."
                      Jul 26 10:52:00 localhost.localdomain dockerd[5983]: time="2019-07-26T10:52:00.428486039Z" level=info msg="Docker daemon" commit=74b1e89 graphdriver(s)=overlay2 version=19.03.1
                      Jul 26 10:52:00 localhost.localdomain dockerd[5983]: time="2019-07-26T10:52:00.428644092Z" level=info msg="Daemon has completed initialization"
                      Jul 26 10:52:00 localhost.localdomain systemd[1]: Started Docker Application Container Engine.
                      Jul 26 10:52:00 localhost.localdomain dockerd[5983]: time="2019-07-26T10:52:00.492803691Z" level=info msg="API listen on [::]:2375"
                      Jul 26 10:52:00 localhost.localdomain dockerd[5983]: time="2019-07-26T10:52:00.492951650Z" level=info msg="API listen on /var/run/docker.sock"                      


~~~~

target vbox: terraformsandbox03  
activating multiple sockets "multiple_sockets.conf"
~~~~
Commands:

> vagrant ssh terraformsandbox03

[vagrant@localhost ~]$ hostnamectl
   Static hostname: localhost.localdomain
         Icon name: computer-vm
           Chassis: vm
        Machine ID: cfa0388701ff415dbceb1d083ec3fdfd
           Boot ID: e5800c1023494230bbde3c9d5c0fe855
    Virtualization: kvm
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-957.1.3.el7.x86_64
      Architecture: x86-64

      [vagrant@localhost ~]$ ifconfig
      docker0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
              inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
              inet6 fe80::42:88ff:fe9b:68b1  prefixlen 64  scopeid 0x20<link>
              ether 02:42:88:9b:68:b1  txqueuelen 0  (Ethernet)
              RX packets 1824  bytes 5483894 (5.2 MiB)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 3661  bytes 7276725 (6.9 MiB)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

      eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
              inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
              inet6 fe80::90c0:df11:866c:48ab  prefixlen 64  scopeid 0x20<link>
              ether 08:00:27:df:b1:7a  txqueuelen 1000  (Ethernet)
              RX packets 752982  bytes 815013188 (777.2 MiB)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 218874  bytes 13526389 (12.8 MiB)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

      eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
              inet 172.28.128.16  netmask 255.255.255.0  broadcast 172.28.128.255
              inet6 fe80::a00:27ff:fe18:2aa6  prefixlen 64  scopeid 0x20<link>
              ether 08:00:27:18:2a:a6  txqueuelen 1000  (Ethernet)
              RX packets 4383  bytes 346493 (338.3 KiB)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 6149  bytes 6956344 (6.6 MiB)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

      lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
              inet 127.0.0.1  netmask 255.0.0.0
              inet6 ::1  prefixlen 128  scopeid 0x10<host>
              loop  txqueuelen 1000  (Local Loopback)
              RX packets 12  bytes 984 (984.0 B)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 12  bytes 984 (984.0 B)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

      veth988b584: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
              inet6 fe80::a8c7:71ff:feb0:5b48  prefixlen 64  scopeid 0x20<link>
              ether aa:c7:71:b0:5b:48  txqueuelen 0  (Ethernet)
              RX packets 703  bytes 764269 (746.3 KiB)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 1121  bytes 3597845 (3.4 MiB)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

      vethc9be852: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
              inet6 fe80::5471:b8ff:fee3:c063  prefixlen 64  scopeid 0x20<link>
              ether 56:71:b8:e3:c0:63  txqueuelen 0  (Ethernet)
              RX packets 0  bytes 0 (0.0 B)
              RX errors 0  dropped 0  overruns 0  frame 0
              TX packets 8  bytes 656 (656.0 B)
              TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

              [vagrant@localhost ~]$ sudo docker version
              Client: Docker Engine - Community
               Version:           19.03.1
               API version:       1.40
               Go version:        go1.12.5
               Git commit:        74b1e89
               Built:             Thu Jul 25 21:21:07 2019
               OS/Arch:           linux/amd64
               Experimental:      false

              Server: Docker Engine - Community
               Engine:
                Version:          19.03.1
                API version:      1.40 (minimum version 1.12)
                Go version:       go1.12.5
                Git commit:       74b1e89
                Built:            Thu Jul 25 21:19:36 2019
                OS/Arch:          linux/amd64
                Experimental:     false
               containerd:
                Version:          1.2.6
                GitCommit:        894b81a4b802e4eb2a91d1ce216b8817763c29fb
               runc:
                Version:          1.0.0-rc8
                GitCommit:        425e105d5a03fabd737a126ad93d62a9eeede87f
               docker-init:
                Version:          0.18.0
                GitCommit:        fec3683

                [vagrant@localhost ~]$ sudo systemctl status docker.service
                ● docker.service - Docker Application Container Engine
                   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
                  Drop-In: /etc/systemd/system/docker.service.d
                           └─multiple_sockets.conf
                   Active: active (running) since Fri 2019-07-26 08:04:42 UTC; 3h 41min ago
                     Docs: https://docs.docker.com
                 Main PID: 5974 (dockerd)
                    Tasks: 26
                   Memory: 64.7M
                   CGroup: /system.slice/docker.service
                           ├─ 5974 /usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:4141 -H tcp://0.0.0.0:4142
                           ├─ 6704 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8081 -container-ip 172.17.0.2 -container-port 8080
                           └─10325 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 9000 -container-ip 172.17.0.3 -container-port 9000

                Jul 26 10:56:35 localhost.localdomain dockerd[5974]: time="2019-07-26T10:56:35.174178446Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:01:40 localhost.localdomain dockerd[5974]: time="2019-07-26T11:01:40.201541537Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:06:45 localhost.localdomain dockerd[5974]: time="2019-07-26T11:06:45.897271210Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:11:51 localhost.localdomain dockerd[5974]: time="2019-07-26T11:11:51.948512065Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:16:56 localhost.localdomain dockerd[5974]: time="2019-07-26T11:16:56.875540870Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:21:58 localhost.localdomain dockerd[5974]: time="2019-07-26T11:21:58.961345618Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:27:03 localhost.localdomain dockerd[5974]: time="2019-07-26T11:27:03.210450199Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:32:08 localhost.localdomain dockerd[5974]: time="2019-07-26T11:32:08.024184796Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:37:13 localhost.localdomain dockerd[5974]: time="2019-07-26T11:37:13.551990981Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"
                Jul 26 11:42:16 localhost.localdomain dockerd[5974]: time="2019-07-26T11:42:16.375014655Z" level=info msg="ignoring event" module=libcontainerd namespace=moby topic=/tasks/delete type="*events.TaskDelete"                      
~~~~
License
-------

GNU General Public License v3.0

Author Information
------------------

An optional section for the role authors
