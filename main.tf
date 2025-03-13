resource "google_container_cluster" "monitoring_cluster" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  node_config {
    machine_type = "n1-standard-4"  # Updated machine type
    disk_size_gb = 70
  }

  remove_default_node_pool = false
}
