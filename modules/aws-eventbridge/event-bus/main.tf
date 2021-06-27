resource "null_resource" "this" {
  count = var.create_rule ? 1 : 0  

  triggers = {
    event_bus_name = var.event_bus_name
  }

  provisioner "local-exec" {
    command = "aws events create-event-bus --name ${var.event_bus_name}"
    on_failure = continue
  }
}