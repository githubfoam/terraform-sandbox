provider "docker" {
    # host = "tcp://${var.docker_host_ip}:4142/"
		version = "~> 2.1"
		host = "tcp://${var.docker_host_ip}:${var.docker_host_port}/"

}
