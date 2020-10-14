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
  depends_on = ["docker_container.registry_container"]

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

  provisioner "file" {
    source      = "./files/Dockerfile.alpine.jre"
    destination = "/home/vagrant/image/Dockerfile.alpine.jre"
  }


  provisioner "remote-exec" {
    inline = [
      # "sudo docker build -t example:latest /home/vagrant/image/",
      "sudo docker build -t alpine:jre --file Dockerfile.alpine.jre .",
      "sudo docker tag alpine:jre localhost:5000/the-alpine-jre-image",
      "sudo docker push localhost:5000/the-alpine-jre-image"
    ]
  }

  provisioner "remote-exec" {
    when    = "destroy"
    inline = [
      "sudo rm -rf /home/vagrant/image",
    ]
  }


}
