resource "google_cloudbuild_trigger" "cbuild-trigger" {

  name        = "github-for-push-trigger"
  description = "github-push-trigger"
  filename    = var.cloudbuild_file

  github {
    name  = var.repo
    owner = var.github_org
    push {
      branch = ".*"
    }
  }
}
