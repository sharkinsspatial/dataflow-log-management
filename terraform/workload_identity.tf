module "workload-identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name       = "loki-promtail"
  namespace  = "default"
  project_id = "${var.project}"
  roles      = ["roles/pubsub.subscriber"]
}

