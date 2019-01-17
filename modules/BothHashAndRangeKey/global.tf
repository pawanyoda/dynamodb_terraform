locals {
  attributes = [
    "${var.hash_key}",
    "${var.range_key}",
  ]
}

resource "aws_dynamodb_table" "dynamodb_table_us_east_1" {
  provider = "aws.us-east-1"

  name             = "${var.table_name}"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity    = "${var.read_capacity}"
  write_capacity   = "${var.write_capacity}"
  hash_key         = "${var.hash_key["name"]}"
  range_key        = "${var.range_key["name"]}"

  attribute = ["${local.attributes}"]

  #lifecycle {
  #  ignore_changes = ["read_capacity", "write_capacity"]
  #}

  ttl {
    attribute_name = "expirationTime"
    enabled        = true
  }

  tags {
    Environment   = "${var.environment}"
  }
}

resource "aws_dynamodb_table" "dynamodb_table_us_west_2" {
  provider = "aws.secondary"

  name             = "${var.table_name}"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity    = "${var.read_capacity}"
  write_capacity   = "${var.write_capacity}"
  hash_key         = "${var.hash_key["name"]}"
  range_key        = "${var.range_key["name"]}"

  attribute = ["${local.attributes}"]

 # lifecycle {
 #   ignore_changes = ["read_capacity", "write_capacity"]
 # }

  ttl {
    attribute_name = "expirationTime"
    enabled        = true
  }

  tags {
    Environment   = "${var.environment}"
  }
}

resource "aws_dynamodb_global_table" "global" {
  depends_on = ["aws_dynamodb_table.dynamodb_table_us_east_1", "aws_dynamodb_table.dynamodb_table_us_west_2"]
  provider   = "aws.us-east-1"

  name = "${var.table_name}"

  replica {
    region_name = "${var.aws_region}"
  }

  replica {
    region_name = "${var.aws_cr_region}"
  }
}
