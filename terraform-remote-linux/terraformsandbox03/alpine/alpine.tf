# Dynamic image
# https://www.terraform.io/docs/providers/docker/r/image.html

data "docker_registry_image" "alpine" {
  name = "alpine:latest"
}

resource "docker_image" "alpine" {
  name          = "${data.docker_registry_image.alpine.name}"
  pull_triggers = ["${data.docker_registry_image.alpine.sha256_digest}"]
}


# Start a container
resource "docker_container" "alpine" {
name  = "foo"
image = "${docker_image.alpine.latest}"
}
