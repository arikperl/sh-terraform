resource "aws_instance" "this" {
    
    count = var.create_instance ? 1 : 0
    
    ami                  = var.ami 
    instance_type        = var.instance_type
    vpc_security_group_ids      = ["${var.vpc_security_group_ids}"]
    subnet_id            = var.subnet_id
    iam_instance_profile = var.iam_instance_profile

    tags = {
    Terraform = "True"
    Name    = var.name
  }
}