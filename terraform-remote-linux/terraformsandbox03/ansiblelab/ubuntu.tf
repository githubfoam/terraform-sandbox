resource "docker_image" "docker_registry" {
  name = "registry:2"
}


resource "docker_container" "registry_container" {
  name = "docker-registry-container"
  image = "${docker_image.docker_registry.latest}"

  restart = "always"

  ports {
    internal = 5000
    external = 5000
  }
}


resource "null_resource" "create_image" {
  connection {
    type = "ssh"
    # host = "${var.ssh_host}"
    host = "172.28.128.16"
    #port = "${var.ssh_port}"
    port = "22"
    #user = "${var.ssh_user}"
    user = "vagrant"
    #private_key = "${file(var.ssh_key)}"
    #private_key = "~/.ssh/id_rsa"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/vagrant/image",
    ]
  }

  provisioner "remote-exec" {
    # Install Python for Ansible
    inline = [
    "sudo yum install ansible",
    "ansible --version"
    ]
  }

  provisioner "local-exec" {
    command = "ansible --version"
  }

}
