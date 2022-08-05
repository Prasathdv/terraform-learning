# resource definition/block to create ec2 vm instance
resource "aws_instance" "ec2-demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  user_data              = <<-EOF
      sudo yum -y update 
      sudo yum install -y httpd 
      sudo systemctl enable httpd
      sudo systemctl start httpd
      echo "<h1>Welcome to webpage created/opened using Terraform</h1><h2>terraform basics. Prasath DV</h2>" > /var/www/html/index.html
  EOF
  tags = {
    "Name" = "ec2-demo-input"
  }
}
