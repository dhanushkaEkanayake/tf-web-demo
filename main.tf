terraform {
	required_providers {
		aws = 	{
      			source = "hashicorp/aws"
			version = "5.0.1"
    		}
  	}
}

#defining provider

provider "aws" {

  	region = var.aws_region
  	shared_credentials_files = ["/home/dhanushka/.aws/credentials"]
  	profile = var.profile

}

#creating ec2 instances 

resource "aws_launch_template" "creativeHub_launch_template" {

	name = "creativeHub-launch-template"

  	image_id =  var.aws_ami
  	instance_type = var.instance_type
  	key_name = var.key_pair

	user_data = filebase64("${path.module}/server.sh")

  	block_device_mappings {
    	device_name = var.device_name

    	ebs {
      		volume_size = var.volume_size
      		volume_type = var.volume_type
    		}
  	}

	monitoring {
    		enabled = true
  	}

  	network_interfaces {
    	associate_public_ip_address = true
    	security_groups = [aws_security_group.creativeHub-web_SG.id]
  	}
}
