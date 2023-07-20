data "aws_caller_identity" "current" {}

local {
    account_id = data.aws_caller_identity.current.account_id
}

resource "aws_kms_key" "KMS_key" {
    description = ""
    deletion_window_in_days = 10
    enable_key_rotation = var.enable_key_rotation
    tags = {
        environment = var.environment
        kms_type = var.kms_type
    }
    policy = <<EOT
    {
        "Version": "2012-10-17,
        "Id": "key-default-1",
        "Statement: [
          {
            "Sid": "Enable IAM User Permission",
            "Action": [
                "kms:*"
            ],
            "Principal": {
              "AWS": "arn:aws:iam:${local.account_id}:root"
            },
            "Effect": "Allow",
            "Resource": "*"
            },
            {
              "Principal": "s3.amazon.com"
            },
              "Action": [
                "kms:Decrypt",
                "kms:GenerateDataKey"
              ],
              "Effect": "Allow",
              "Resource": "*"
            }
        ]
    }
    EOT
}

resource "aws_kms_alias" "kms_alias" {
  name = alias/${var.key_name}
  target_key_id = aws_kms_key.KMS_key.key_id
}