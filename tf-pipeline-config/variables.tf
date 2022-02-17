variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
  default     = "devops-labs-322408"
}

variable "region" {
  description = "GCP region in which to build the infrastructure"
  type        = string
  default     = "us-central1"
}

variable "github_org" {
  description = "Name of the GitHub Repository Owner."
  type        = string
  default     = "yisaienko"
}

variable "repo" {
  description = "Name of the GitHub Repository."
  type        = string
  default     = "for-test-app"
}

variable "cloudbuild_file" {
  description = "Branch name used to trigger builds."
  type        = string
  default     = "cloudbuild.yaml"
}
