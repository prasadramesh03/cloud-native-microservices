terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Use named pipe for Windows
}

resource "docker_image" "user_service" {
  name         = "user-service"
  keep_locally = true
}

resource "docker_container" "user_service" {
  name  = "tf-user-service"
  image = docker_image.user_service.name  # Use the image name directly here
  ports {
    internal = 5000
    external = 5000
  }
}
