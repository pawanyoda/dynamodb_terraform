provider "aws" {
  alias   = "us-east-1"
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

provider "aws" {
  alias   = "secondary"
  region  = "${var.aws_cr_region}"
  profile = "${var.aws_profile}"
}
