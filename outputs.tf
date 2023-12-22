output "policy" {
  value = data.aws_iam_policy_document.assume_role
  description = "Generated assume role policy"
}
