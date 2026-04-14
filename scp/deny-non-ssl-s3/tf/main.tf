resource "aws_organizations_policy" "scp" {
  name        = var.name
  description = "Forces EBS encryption."
  content     = data.aws_iam_policy_document.deny-non-ssl-s3.json
}

#resource "aws_organizations_policy_attachment" "account" {
#  policy_id = aws_organizations_policy.scp.id
#  target_id = "000000000000"
#}

data "aws_organizations_organization" "org" {}

data "aws_organizations_organizational_units" "ou" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy_attachment" "ou" {
  count     = length(data.aws_organizations_organization.org.accounts)
  policy_id = aws_organizations_policy.scp.id
  target_id = data.aws_organizations_organization.org.accounts[count.index].id
}
