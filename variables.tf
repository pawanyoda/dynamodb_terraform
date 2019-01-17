variable "aws_profile" {}

variable "terraformer_bucket" {
  default = ""
}

variable "zone" {
  default = ""
}

variable "aws_region" {}

variable "aws_cr_region" {
  default = "us-west-2"
}

variable "vpc" {
  default = ""
}

variable "product_name" {
  default = "vv20"
}

# variable "hash_key" {
#   type = "map"
# }

# variable "range_key" {
#   type = "map"
# }

variable "enable_autoscale" {
  default = "false"
}

variable "read_capacity" {}

variable "write_capacity" {}

variable "max_read_capacity" {}

variable "max_write_capacity" {}

variable "read_target" {}

variable "write_target" {}

variable "table_name" {
  default = ""
}

