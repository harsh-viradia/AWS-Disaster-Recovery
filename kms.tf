resource "aws_kms_key" "primary" {
  description = "CMK for primary region"
}

resource "aws_kms_key" "secondary" {
  provider = aws.region2

  description = "CMK for secondary region"
}