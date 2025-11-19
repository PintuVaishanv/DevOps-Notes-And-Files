resource "aws_key_pair" "terra-key" {
    key_name = "terra-key-pair-aws-ec2"
    public_key = file("terra-key.pub")
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
    name = "my-security-group"
    description = "My security group"
    vpc_id = aws_default_vpc.default.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}

resource "aws_instance" "my_instance" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    key_name = aws_key_pair.terra-key.key_name
    security_groups = [ aws_security_group.my_security_group.name ]
    user_data = file("ngnix_install.sh")

    root_block_device {
        volume_size = var.ec2_root_disk_size
        volume_type = "gp3"
    }

    tags = {
      name = "my-instance"

    }
  
}
