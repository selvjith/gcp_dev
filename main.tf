terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

resource "google_compute_instance" "default" {
  name         = "terraform_test"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  tags = ["test", "terraform"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 10
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    name = "terraform"
  }
}