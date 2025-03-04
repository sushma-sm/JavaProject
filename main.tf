provider "google" {
  project = "devops-practice-sm"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# Generate a random ID for uniqueness
resource "random_id" "vm_suffix" {
  byte_length = 4
}

# Create a VM instance with a unique name
resource "google_compute_instance" "my_vm" {
  name         = "my-terraform-vm-${random_id.vm_suffix.hex}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
