module global_user-session {
  source = "./modules/BothHashAndRangeKey"

  read_capacity  = "${var.read_capacity_user_session}"
  write_capacity = "${var.write_capacity_user_session}"

  hash_key = {
    name = "venue_id"
    type = "N"
  }

  range_key = {
    name = "data_state"
    type = "N"
  }

  environment        = "${var.environment"
  table_name         = "${module.name}-user-session"
  aws_region         = "${var.aws_region}"
  aws_cr_region      = "${var.aws_cr_region}"
  aws_profile        = "${var.aws_profile}"
}



#Error: Error asking for user input: 1 error(s) occurred:

* module.global_user-session-asgard.aws_dynamodb_table.dynamodb_table_us_east_1: configuration for module.global_user-session-asgard.provider.aws.us-east-1 is not present; a provider configuration block is required for all operations
