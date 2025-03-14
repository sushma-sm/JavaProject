resource "google_container_cluster" "monitoring_cluster" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = 70
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  remove_default_node_pool = false

  # Enable logging and monitoring for better observability
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}
