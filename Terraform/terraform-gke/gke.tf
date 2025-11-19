module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 30.0.0"

  project_id   = local.project_id
  name         = local.gke_cluster_name
  region       = local.gke_region
  network      = module.network.network_name
  subnetwork   = module.network.subnets_names[0]

  ip_range_pods     = "pods-secondary-range"
  ip_range_services = "services-secondary-range"

  node_pools = [
    {
      name         = "group-1"
      machine_type = "e2-medium"
      min_count    = 1
      max_count    = 3
      preemptible  = true
    }
  ]

  network_policy = true
  dns_cache      = true

  release_channel = "REGULAR"

  depends_on = [
    module.network
  ]
}