module "Dynamodb1" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "2.0.0"

  name             = "harsh-viradia-db-1"
  hash_key         = "id"
  range_key        = "title"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  server_side_encryption_enabled     = true
  server_side_encryption_kms_key_arn = aws_kms_key.primary.arn

  attributes = [
    {
      name = "id"
      type = "N"
    },
    {
      name = "title"
      type = "S"
    },
    {
      name = "age"
      type = "N"
    }
  ]

  global_secondary_indexes = [
    {
      name               = "TitleIndex"
      hash_key           = "title"
      range_key          = "age"
      projection_type    = "INCLUDE"
      non_key_attributes = ["id"]
    }
  ]

  replica_regions = [{
    region_name            = "us-east-2"
    kms_key_arn            = "${aws_kms_key.secondary.arn}"
    propagate_tags         = true
    point_in_time_recovery = true
  }]
}
