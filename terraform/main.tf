
terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
			version = "~> 3.0"
		}
	}
}

provider "docker" {}

resource "docker_image" "web_health" {
	name = "web-health-monitor:latest"

	build {
		context = "${path.module}/../app"
	}
}

resource "docker_container" "web_health" {
	name = "web-health-monitor"
	image = docker_image.web_health.image_id

	ports {
		internal = 5000
		external = 5000
	}
}
