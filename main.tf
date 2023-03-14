terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("/home/coditas/Desktop/GoCD/pt-development-220816-d22674d2763d.json")

  project = "pt-development-220816"
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "vm_instance" {
  name         = "gcptutorials-vm"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }    
  network_interface {
    network = "default"
    access_config {
    }
  }
}
