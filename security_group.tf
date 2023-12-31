#Defining security group for ec2 instances

resource "aws_security_group" "applova-web_SG" {
  	name = "applova-web_SG"

  	ingress {
    	from_port   = 80
    	to_port     = 80
    	protocol    = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
	}

  	ingress {
    	from_port   = 22
    	to_port     = 22
   	protocol    = "tcp"
    	cidr_blocks = ["0.0.0.0/0"]
  	}

  	egress {
        from_port   = 0
    	to_port     = 0
    	protocol    = "-1"
   	cidr_blocks = ["0.0.0.0/0"]
  	}

	vpc_id = aws_vpc.applova_vpc.id
	
	depends_on = [aws_vpc.applova_vpc]

	tags = {
    		Name = "applova-web_SG"
  	}
}
