provider "aws" {
  region    = "ap-northeast-1"
}



resource "aws_vpc" "sauravVPC" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sauravVPC.id

  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "mySubnet" {
  vpc_id     = aws_vpc.sauravVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet"
  }
}

resource "aws_route_table" "sauravkr" {
  vpc_id = aws_vpc.sauravVPC.id

  route = []

  tags = {
    Name = "sauravkr"
  }
}

resource "aws_route" "r" {
  route_table_id            = aws_route_table.sauravkr.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  depends_on                = [aws_route_table.sauravkr]
}

resource "aws_security_group" "saurav" {
  name        = "allow_all_traffic"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.sauravVPC.id

  ingress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "outbond_rule"
    prefix_list_ids = null
    security_groups = null
    self = null
  }

  tags = {
    Name = "all_traffic"
  }
}

resource "aws_launch_configuration" "windows" {
  name          = "foo"
  image_id      = "ami-0579463af8659b803"
  instance_type = "t2.micro"
}

resource "aws_security_group" "elb_http" {
  name = "elb_http"
  description = "ALLOW HTTP traffic to instance through Elastic Load Balancer,ssh"
  vpc_id = "aws_vpc.sauravVPC.id"
  
}


  
  
# resource "aws_elb" "web_elb" {
#   name = "web_elb"
    
# }
# subnet= [
#   "aws_subnet.public_ap-northeast-1.id",
#   "aws_subnet.public_ap-northeast-1.id"
#  ]

# cross_zone_load_balancing = true
# health_check {
#   healthy_threshold= 2
#   unhealthy_threshold = 2
#    timeout= 3
#   interval=30
#   target = "HTTP:80/"
# }

#  listner {
#    lb_port=80
#    lb_protocol= "http"
#    instance_port="80"
#    instance_protocol="http"
           

#  }

resource "aws_autoscaling_group" "windows" {
  name = "aws_launch_configuration.windows.foo"

  min_size = 1
  desired_capacity = 2
  max_size = 4

  health_check_type = "ELB"

 load_balancers = [ "aws_elb.web_elb.id}" ]

  launch_configuration = "{aws_launch_configuration.windows.foo}"
  
}


resource "aws_autoscaling_policy" "windows_policy_up" {
  name =  "windows_policy_up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "aws_autoscaling_group.windows.foo}"
}


