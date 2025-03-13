# Fetch GKE Cluster Details
data "google_client_config" "sm_default" {}

data "google_container_cluster" "sm_gke_cluster" {
  name     = var.cluster_name
  location = var.region
  depends_on = [google_container_cluster.monitoring_cluster]  # Fixed the resource reference
}

# Kubernetes Provider using GKE authentication
provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.sm_gke_cluster.endpoint}"
  token                  = data.google_client_config.sm_default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.sm_gke_cluster.master_auth[0].cluster_ca_certificate)
}

# Helm Provider using GKE authentication
provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.sm_gke_cluster.endpoint}"
    token                  = data.google_client_config.sm_default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.sm_gke_cluster.master_auth[0].cluster_ca_certificate)
  }
}

module "sm_delegate" {
  source           = "harness/harness-delegate/kubernetes"
  version          = "0.1.8"
  
  account_id       = "ucHySz2jQKKWQweZdXyCog"
  delegate_token   = "NTRhYTY0Mjg3NThkNjBiNjMzNzhjOGQyNjEwOTQyZjY="
  delegate_name    = "sm-terraform-delegate"
  deploy_mode      = "KUBERNETES"
  namespace        = "sm-harness-delegate-ng"
  manager_endpoint = "https://app.harness.io"
  delegate_image   = "harness/delegate:25.02.85300"
  replicas         = 1
  upgrader_enabled = true
  depends_on       = [google_container_cluster.monitoring_cluster]  # Fixed the resource reference
}
