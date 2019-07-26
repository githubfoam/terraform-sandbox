
data "docker_registry_image" "nginx-proxy" {
  name = "nginx:latest"
}


resource "docker_image" "nginx-proxy" {
name         = "${data.docker_registry_image.nginx-proxy.name}"
pull_trigger = "${data.docker_registry_image.nginx-proxy.sha256_digest}"
}

resource "docker_container" "nginx-proxy2" {
name  = "nginx-proxy2"
image = "${docker_image.nginx-proxy.latest}"
	ports {
	internal = 80
	external = 84
	protocol = "tcp"
	}
	volumes {
	host_path      = "/var/run/docker.sock"
	container_path = "/tmp/docker.sock"
	read_only      = true
	}
}
