module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "11.3.1"

  project_id = var.project_id

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddeploy.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "servicenetworking.googleapis.com"
  ]
}