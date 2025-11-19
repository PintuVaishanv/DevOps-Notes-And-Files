module "network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.0"

  project_id   = local.project_id
  network_name = "{${local.gke_cluster_name}}-vpc-network"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name       = "private-subnet-1"
      subnet_ip         = local.private_subnets
      subnet_region     = local.azs[0]
      subnet_secondary_ip_ranges = []
      subnet_labels = {
        Terraform   = "true"
        Environment = local.env
      }

  enable_nat_gateway = true
  enable_vpn_gateway = false
    }
  ]

}
