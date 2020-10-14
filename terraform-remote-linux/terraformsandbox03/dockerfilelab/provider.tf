# https://www.terraform.io/docs/providers/null/resource.html

provider "docker" {
  version = "~> 2.0"
  host = "tcp://172.28.128.16:4142"
}


provider "null" {
  version = "~> 2.0"
}
