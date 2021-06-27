
resource "null_resource" "this_rule" {
  count = var.create_rule ? 1 : 0  

  triggers = {
    event_pattern = var.event_pattern
  }

  provisioner "local-exec" {
    command = "aws events put-rule --name '${var.rule_name}' --event-pattern \"${var.event_pattern}\" --event-bus ${var.event_bus}"
  }
}
## Enter Sleep for 5 seconds
resource "null_resource" "delay" {
  count = var.create_rule ? 1 : 0 

  triggers = {
    before = null_resource.this_rule[0].id
  }

  provisioner "local-exec" {
    command = "sleep 5"
  }
}

###" Continue After sleep

resource "null_resource" "this_target" {
  count = var.create_rule ? 1 : 0  

  triggers = {
    event_target = var.event_pattern
  }
  depends_on = [
    null_resource.delay,
    ]

  provisioner "local-exec" {
    command = "aws events put-targets --rule '${var.rule_name}' --event-bus-name ${var.event_bus} --targets \"Id\"=\"1\",\"Arn\"=\"${var.event_target}\",\"SqsParameters\"=\"{\"MessageGroupId\"= \"${var.rule_name}\"}\" "
  } 
}