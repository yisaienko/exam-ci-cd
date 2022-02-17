resource "google_service_account" "service_account" {
  project      = var.project_id
  account_id   = "pipeline-approver"
  display_name = "Deployments Pipeline Approver"
}

resource "google_project_iam_member" "clouddeploy_approver" {
  project = var.project_id
  role    = "roles/clouddeploy.approver"
  member  = "serviceAccount:pipeline-approver@devops-labs-322408.iam.gserviceaccount.com"
}
