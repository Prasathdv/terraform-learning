# resource definition to add ssh and web(http) security groups

# ssh security group
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "to allow traffic in ssh port"

  ingress {
    description = "To Allow inbound traffic to ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "To Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/* Port-443 allows data transmission over a secured network, while Port 80 enables data transmission in plain text. 
   Users will get an insecure warning if he tries to access a non-HTTPS web page. 
   Port 443 encrypts network data packets before data transmission takes place.*/

# ssh security group
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "to allow traffic in web(http) port"

  ingress {
    description = "to allow inbound traffic in http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "To allow inbound traffic to secure web traffic https port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "To allow all traffic outbound to all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
