# Configure the Docker provider
# +/- From https://www.terraform.io/docs/providers/docker/

provider "docker" {
  version = "~> 2.0"
    host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "foo" {
  image = "${docker_image.ubuntu.latest}"
  name  = "foo"
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}
