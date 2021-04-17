resource "aws_kms_key" "default_kms" {
  id                  = "default_kms"
  description         = "KMS key 1"
  enable_key_rotation = true

  tags = merge(var.default_tags, var.tags)
}

resource "aws_s3_bucket" "artifacts" {
  #tfsec:ignore:AWS002
  #tfsec:ignore:AWS077
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"

  acl           = "private"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.default_kms.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(var.default_tags, var.tags)
}

