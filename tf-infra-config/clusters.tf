locals {
  cluster_type = "regional"
}

module "cluster-dev" {
  source            = "./modules/cluster"
  project_id        = var.project_id
  name              = "dev"
  region            = var.region
  network           = google_compute_network.network.name
  subnetwork        = google_compute_subnetwork.subnetwork.name
  ip_range_master   = "10.1.0.0/28"
  ip_range_pods     = ""
  ip_range_services = ""
  release_channel   = "STABLE"
}

module "cluster-stage" {
  source            = "./modules/cluster"
  project_id        = var.project_id
  name              = "stage"
  region            = var.region
  network           = google_compute_network.network.name
  subnetwork        = google_compute_subnetwork.subnetwork.name
  ip_range_master   = "10.1.1.0/28"
  ip_range_pods     = ""
  ip_range_services = ""
  release_channel   = "STABLE"
}

module "cluster-prod" {
  source            = "./modules/cluster"
  project_id        = var.project_id
  name              = "prod"
  region            = var.region
  network           = google_compute_network.network.name
  subnetwork        = google_compute_subnetwork.subnetwork.name
  ip_range_master   = "10.1.2.0/28"
  ip_range_pods     = ""
  ip_range_services = ""
  release_channel   = "STABLE"
}
