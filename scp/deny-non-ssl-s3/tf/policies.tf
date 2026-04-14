data "aws_iam_policy_document" "deny-non-ssl-s3" {
  statement {
    sid    = "DenyNonSSLS3"
    effect = "Deny"

    actions = [
      "s3:*"
    ]

    resources = [
      "arn:aws:s3:::*",
      "arn:aws:s3:::*/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values = [
        "false"
      ]
    }
  }
}
