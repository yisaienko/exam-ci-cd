terraform {
  backend "gcs" {
    bucket = "devops-labs-322408-tfstate"
    prefix = "pipeline"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.64.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
