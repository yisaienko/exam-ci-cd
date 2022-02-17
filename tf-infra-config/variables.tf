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
