terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.7.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  chart      = "prometheus-community/kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  version    = "51.2.0"

  values = [
    file("prometheus-values.yaml")
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  chart      = "grafana/grafana"
  repository = "https://grafana.github.io/helm-charts"
  version    = "6.56.2"

  values = [
    file("grafana-values.yaml")
  ]
}
