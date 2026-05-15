data "aws_iam_policy_document" "force_rds_encryption" {
  statement {
    sid    = "PreventUnencryptedRDSCreation"
    effect = "Deny"

    actions = [
      "rds:CreateDBInstance",
      "rds:CreateDBCluster"
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "Bool"
      variable = "rds:StorageEncrypted"
      values = [
        "false"
      ]
    }
  }
}
