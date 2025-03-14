terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.80.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    utils = {
      source  = "cloudposse/utils"
      version = "1.18.0"  # Critical addition to resolve the error
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-east5"    # Matches region without zone suffix
  zone    = "us-east5-b"  # Zone specification is correct here
}

provider "random" {}
