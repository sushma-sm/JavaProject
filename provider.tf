terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.80.0"  # You can adjust this to the latest version
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"  # Adjust this to the latest version as needed
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east5"  # Updated to match the cluster region
  zone    = "us-east5-b"  # Added zone to specify the cluster location accurately
}

provider "random" {}
