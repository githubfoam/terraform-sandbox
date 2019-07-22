# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  version = "~> 2.0"
  host = "unix:///var/run/docker.sock"
  alias       = "nginx"
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
