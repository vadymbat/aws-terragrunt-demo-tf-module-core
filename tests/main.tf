module "core" {
  source = "./.."
  aws_region = "us-east-1"
  aws_provider_role = "arn:aws:iam::063440148893:role/tf_admin_access"
}