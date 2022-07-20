data "google_client_config" "default" {
}

provider "kubernetes" {
  host     = "https://${google_container_cluster.primary.endpoint}"
  username = var.gke_username
  password = var.gke_password
  token    = data.google_client_config.default.access_token
  client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
  client_key             = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  )
}

