resource "google_service_account" "promtail-service-account" {
  account_id   = "promtail-service-account"
  display_name = "Promtail Service Account"
}

resource "google_project_iam_member" "service_account_binding" {
  project = "${var.project}"
  role    = "roles/pubsub.subscriber"
  member  = "serviceAccount:${google_service_account.promtail-service-account.email}"
}
