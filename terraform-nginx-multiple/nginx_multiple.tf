# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  version = "~> 2.0"
  host = "unix:///var/run/docker.sock"
  alias       = "nginx-v1"
}

# Configure nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}


# Create an Nginx container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
# name = "nginx"
  count = 2
  name = "nginx-terraform-${format("%02d", count.index+1)}"

   env = ["env=test", "role=test"]
   restart = "always"
   memory = 128


  ports {
      internal = 80
    }

    volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/scrapbook/tutorial/www"
    read_only = true
    }

    log_driver = "json-file"
      log_opts = {
        max-size = "1m"
        max-file = 2
      }

}
