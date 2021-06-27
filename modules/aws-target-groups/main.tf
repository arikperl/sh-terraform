# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }


# Create Rule and rule attachment
resource "aws_lb_target_group" "this_tg" {
  count = var.create_tg ? 1 : 0

  name     = "TG-BOND-${var.name}"
  port     = var.port
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

resource "aws_lb_listener_rule" "this_tg" {
  listener_arn = "${var.listener_arn}"
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.this_tg[0].arn}"
  }
  condition {
    host_header {
      values = ["${var.host_header}.withbond.io"]
    }
  }
}

resource "aws_lb_target_group_attachment" "this_tg" {
  count            = var.count_ids
  target_group_arn = "${aws_lb_target_group.this_tg[0].arn}"
  target_id        = "${element(var.instance_ids, count.index)}"
  port             = var.port
}