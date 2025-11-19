provider "google" {
    project     = local.project_id
    region      = local.gke_region
  
}