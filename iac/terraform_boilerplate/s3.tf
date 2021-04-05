provider "aws" {
  region = "eu-central-1"
}

data "aws_caller_identity" "this" {}

locals {
  bucket_name = var.bucket_name
  users_with_state_access = [
    var.user,
  ]
  user_arns_with_state_access = [
    for user in local.users_with_state_access :
    "arn:aws:iam::${data.aws_caller_identity.this.account_id}:user/${user}"
  ]
}

data "aws_iam_policy_document" "tfstate-bucket-policy" {
  statement {
    effect = "Deny"
    actions = [
      "s3:*Object*",
    ]
    not_principals {
      identifiers = local.user_arns_with_state_access
      type        = "AWS"
    }

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
      "arn:aws:s3:::${local.bucket_name}/*",
    ]
  }
}

resource "aws_kms_key" "master" {
  description = "Default KMS"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = local.bucket_name
  policy = data.aws_iam_policy_document.tfstate-bucket-policy.json

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.master.arn
       sse_algorithm     = "aws:kms"
      }
    }
  }
  tags =  merge(var.tags, map("Name", "S3 Remote Terraform State Store")


resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "tfstate_bucket" {
  value = aws_s3_bucket.tfstate.bucket
}
