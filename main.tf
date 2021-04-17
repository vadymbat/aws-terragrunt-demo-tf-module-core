resource "aws_kms_key" "default_kms" {
  #tfsec:ignore:AWS077

  id          = "default_kms"
  description = "KMS key 1"

  tags = merge(var.default_tags, var.tags)
}

resource "aws_s3_bucket" "artifacts" {
  #tfsec:ignore:AWS019
  #tfsec:ignore:AWS002

  acl    = "private"
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

