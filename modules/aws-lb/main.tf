# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }


resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0

  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = "${split(",", var.security_groups)}"
  subnets            = "${split(",", var.subnets)}"

  enable_deletion_protection = var.enable_deletion_protection

  access_logs {
    bucket  = "withbond-alb-${var.env_suffix}"
    prefix  = "${var.env_suffix}-lb"
    enabled = false
  }
}


resource "aws_lb_listener" "this" {
  count = var.create_lb ? 1 : 0

  load_balancer_arn = "${aws_lb.this[0].arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

#########################################
# ALB TG default rule
#########################################

#Default rule
resource "aws_lb_target_group" "default" {
  count = var.create_lb ? 1 : 0

  name     = "TG-BOND-DEFAULT-${var.tg_suffix}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

resource "aws_lb_listener" "default" {
  count = var.create_lb ? 1 : 0

  load_balancer_arn = "${aws_lb.this[0].arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "${var.certificate_arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.default[0].arn}"
  }
}
