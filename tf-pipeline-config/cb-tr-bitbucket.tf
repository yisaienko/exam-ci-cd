resource "google_cloudbuild_trigger" "cbuild-trigger-bb" {

  name        = "bb-for-push-trigger"
  description = "bb-push-trigger"
  filename    = var.cloudbuild_file

  trigger_template {
    branch_name = ".*"
    repo_name   = "bitbucket_isaienkoy_testreponame"
  }
}
