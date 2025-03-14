variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "devops-practice-sm"
}

# Changed from "us-east5-b" (zone) to "us-east5" (region)
variable "region" {
  description = "The GCP region (not zone)"
  type        = string
  default     = "us-east5"  # Region without zone suffix
}

# New variable for zone specification
variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-east5-b"  # Specific zone
}

variable "cluster_name" {
  description = "The name of the existing Kubernetes cluster"
  type        = string
  default     = "cluster-6"
}

variable "gcp_credentials" {
  description = "GCP service account credentials (JSON)"
  type        = string
  sensitive   = true
}
