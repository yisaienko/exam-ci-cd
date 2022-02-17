resource "google_project_iam_member" "cloudbuild_iam_serviceagent" {
  project = var.project_id
  role    = "roles/cloudbuild.serviceAgent"
  member  = "serviceAccount:208374212091@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_iam_clouddeployreleaser" {
  project = var.project_id
  role    = "roles/clouddeploy.releaser"
  member  = "serviceAccount:208374212091@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_iam_serviceaccountuser" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:208374212091@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloudbuild_iam_objectviewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:208374212091@cloudbuild.gserviceaccount.com"
}
