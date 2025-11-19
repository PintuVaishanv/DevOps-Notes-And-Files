variable "ec2_instance_type" {
  default = "t3.micro" 
  type = string
}

variable "ec2_root_disk_size" {
    default = 20
    type = number
  
}

variable "ec2_key_name" {
    default = "terra-key-pair-aws"
    type = string
}

variable "ec2_ami_id" {
    default = "ami-0360c520857e3138f"
    type = string
}