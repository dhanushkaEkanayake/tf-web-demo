variable "aws_region" {
 type        = string
 description = "AWS region for deployments"
 default     = "us-east-1"
}

variable "profile" {
 type        = string
 description = "Profile for configurations"
 default     = "applova-Profile"
}

variable "aws_ami" {
 type        = string
 description = "AMI for Instance"
 default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
 type        = string
 description = "Type of instance"
 default     = "t2.micro"
}

variable "key_pair" {
 type        = string
 description = "key pair for instance"
 default     = "applova_key_pair"
}

variable "device_name" {
 type        = string
 description = "Path of volume device"
 default     = "/dev/sda1"
}

variable "volume_size" {
 type        = number
 description = "Size of volume"
 default     = 15
}

variable "volume_type" {
 type        = string
 description = "Type of volume"
 default     = "gp2"
}

