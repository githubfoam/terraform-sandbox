provider "docker" {
  version = "~> 2.0"
#  host = "tcp://${var.docker_host_ip}:${var.docker_host_port}/"
  host = "tcp://172.28.128.15:4141/"
#  alias       = "nginx"
}

# Configure nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}


# Create an Nginx container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name = "nginx-server"
  ports {
    internal = 80
    external = 80
  }
}
