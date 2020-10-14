module "vagrant" {
	source	= "./vagrant"
}

module "docker"{
	source = "./docker"
	aws_ip = "${module.vagrant.public_ip}"
}
