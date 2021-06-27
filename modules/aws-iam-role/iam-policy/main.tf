

resource "aws_iam_policy" "this" {
  count = var.create_iam_policy ? 1 : 0

  name        = var.name
  path        = "/"
  description = var.description

  policy = var.policy
}