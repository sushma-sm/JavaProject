variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "devops-practice-sm"  
}

variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-west3-c"  # Changed to a region with sufficient quota
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "monitoring-cluster"  # Changed to match the purpose
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster"
  type        = number
  default     = 3  # Adjusted to match the standard setup
}

variable "node_machine_type" {
  description = "The type of machine to use for nodes in the Kubernetes cluster"
  type        = string
  default     = "e2-medium"  # Adjusted to a cost-effective and sufficient machine type
}
