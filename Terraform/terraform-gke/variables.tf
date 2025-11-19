locals {
    gke_region = "europe-west1"
    gke_cluster_name = "gke-cluster"
    project_id = "primeval-argon-465014-s8"
    vpc_cidr = "244.178.44.111/16"
    azs = ["europe-west1-a", "europe-west1-b", "europe-west1-c"]
    private_subnets = ["244.178.44.111/24", "237.84.2.178/24", "237.84.2.178/24"]
    public_subnets = ["237.84.2.178/24", "89.0.142.86/24", "89.207.132.170/24"]
    intra_subnets = ["244.178.44.111/24", "237.84.2.178/24", "237.84.2.178/24"]
    env = "dev"

}