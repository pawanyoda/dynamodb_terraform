variable "aws_region" {}
variable "aws_profile" {}

variable "aws_cr_region" {
  default = "us-west-2"
}

variable "environment_tag" {}

variable "product_code_tag" {}

variable "inventory_code_tag" {}

variable "hash_key" {
  type = "map"
}

variable "range_key" {
  type = "map"
}

variable "read_capacity" {}

variable "write_capacity" {}

variable "table_name" {
  default = ""
}
