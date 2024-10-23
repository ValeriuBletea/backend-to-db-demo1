# data source/lookup - it is when you want to fetch the information about existing resources

data "aws_vpc" "default" {
  default = true
}
