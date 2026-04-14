data "aws_iam_policy_document" "allow_full_access" {
  statement {
    sid    = "AllowFullAccess"
    effect = "Allow"

    actions = [
      "*"
    ]

    resources = [
      "*"
    ]
  }
}
