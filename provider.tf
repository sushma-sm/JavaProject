terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.80.0"  # Verified compatible version
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    utils = {
      source  = "cloudposse/utils"
      version = "1.18.0"  # Required for deep_merge_yaml
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

provider "random" {}
