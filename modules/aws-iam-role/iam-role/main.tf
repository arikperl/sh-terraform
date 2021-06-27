

resource "aws_iam_role" "this" {
  count = var.create_iam_role ? 1 : 0

  name = var.name

  assume_role_policy = var.policy
}