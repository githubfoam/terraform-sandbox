
data "docker_registry_image" "jenkinsci" {
  name = "jenkins/jenkins:lts"
}

resource "docker_image" "jenkinsci" {
name         = "${data.docker_registry_image.jenkinsci.name}"
pull_trigger = "${data.docker_registry_image.jenkinsci.sha256_digest}"
}

resource "docker_container" "jenkinsci" {
name  = "jenkinsci"
image = "${docker_image.jenkinsci.latest}"
  ports {
  internal = 8080
  external = 8080
  protocol = "tcp"
  }
}
