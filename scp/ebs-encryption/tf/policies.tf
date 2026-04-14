data "aws_iam_policy_document" "force_ebs_encryption" {
  statement {
    sid    = "PreventUnencryptedEBSvolCreation"
    effect = "Deny"

    actions = [
      "ec2:CreateVolume"
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "Bool"
      variable = "ec2:Encrypted"
      values = [
        "false"
      ]
    }
  }

  statement {
    sid    = "PreventEc2MountUnencryptedVolume"
    effect = "Deny"

    actions = [
      "ec2:RunInstances"
    ]

    resources = [
      "arn:aws:ec2:*:*:volume/*"
    ]

    condition {
      test     = "Bool"
      variable = "ec2:Encrypted"
      values = [
        "false"
      ]
    }
  }
}
