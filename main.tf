provider "google" {
  project = "devops-practice-sm"
  region  = "us-central1"
  zone    = "us-central1-a"  # Specify the zone for VM
}

# Create a VM instance
resource "google_compute_instance" "my_vm" {
  name         = "my-terraform-vm"
  machine_type = "e2-medium"  # Choose your VM type
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Use a public Debian image
    }
  }

  network_interface {
    network = "default"  # Uses the default VPC network
    access_config {}     # Assigns a public IP
  }
}
