# Defining input variables

# vpc region
variable "vpc_region" {
  type        = string
  default     = "us-east-1"
  description = "vpc east region"
}

# instance type
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "ec2 vm instance type t3 micro"
}

# ami id
variable "ami_id" {
  type        = string
  default     = "ami-090fa75af13c156b4"
  description = "Latest ami id for amazon linux distro in us east region"
}


