data "aws_iam_policy_document" "restrict_ec2_types" {
  statement {
    sid    = "LimitEC2InstanceType"
    effect = "Deny"

    actions = [
      "ec2:RunInstances"
    ]

    resources = [
      "arn:aws:ec2:*:*:instance/*"
    ]

    condition {
      test     = "StringNotEquals"
      variable = "ec2:InstanceType"
      values = [
        "t2.micro"
      ]
    }
  }
}
