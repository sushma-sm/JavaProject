variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "devops-practice-sm"
}

variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-east5-b"  # Updated to match the existing cluster location
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "cluster-6"  # Updated to match the existing cluster name
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster"
  type        = number
  default     = 3  # Keeping this as a reference, even though the cluster already exists
}

variable "node_machine_type" {
  description = "The type of machine to use for nodes in the Kubernetes cluster"
  type        = string
  default     = "e2-medium"  # Keeping this as a reference for future cluster creations
}
