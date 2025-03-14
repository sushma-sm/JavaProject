# Fetch GKE Cluster Details
data "google_client_config" "sm_default" {}

data "google_container_cluster" "sm_gke_cluster" {
  name     = var.cluster_name
  location = var.region
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
