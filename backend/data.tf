# data source/lookup - it is when you want to fetch the information about existing resources

data "aws_vpc" "default" {
  default = true
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }


}