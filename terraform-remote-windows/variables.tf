# ‘variables.tf’ has the variables declared

variable "docker_host_ip" {
}

variable "docker_host_port" {
  default = "2375"
}

variable "ssh_user" {
}

variable "ssh_host" {
}

variable "ssh_port" {
}
variable "ssh_key" {
  # If your variable is a string you can omit the type
  # type = "string"
}
