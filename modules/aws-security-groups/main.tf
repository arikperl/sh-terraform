

##Run this when SG is with port to IP AND SGs###
resource "aws_security_group" "this_sg" {
  count = var.create_sg && var.ports_to_source != {} && var.ports_to_ip != {} ? 1 : 0

  name        = "${var.name}"
  description = var.description
  vpc_id      = var.vpc_id


  dynamic "ingress" {
    for_each  =  var.ports_to_source
    content {
        from_port   = ingress.key
        to_port     = ingress.key
        protocol    = var.protocol
        security_groups = "${split(",", ingress.value)}"
        description = "Port ${ingress.key} Rule"
        self        = var.self
    }
  }

  dynamic "ingress" {
    for_each  =  var.ports_to_ip
    content {
        from_port   = ingress.key
        to_port     = ingress.key
        protocol    = var.protocol
        cidr_blocks = "${split(",", ingress.value)}"
        description = "Port ${ingress.key} Rule"
        self        = var.self
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}"
  }

}