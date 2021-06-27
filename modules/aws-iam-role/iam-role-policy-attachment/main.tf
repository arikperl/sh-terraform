

resource "aws_iam_role_policy_attachment" "this" {
  count = var.create_iam_role_attachment ? 1 : 0

  policy_arn = var.policy_arn
  role       = var.role
}