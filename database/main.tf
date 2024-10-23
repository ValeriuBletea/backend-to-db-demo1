resource "aws_security_group" "rds_allow_sql" {
  name        = "rds_allow_sql"
  description = "Allow sql inbound traffic from everywhere"
  vpc_id      = data.aws_vpc.default.id
  tags = {
    Name = "rds_allow_sql"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_sql_ipv4" {
  security_group_id = aws_security_group.rds_allow_sql.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffilc_ipv4" {
  security_group_id = aws_security_group.rds_allow_sql.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
#####################################
resource "aws_db_instance" "mydb" {
  identifier           = "rds-demo-24b"
  allocated_storage    = 10
  db_name              = "demo_db_111111"
  engine               = "mysql"
  engine_version       = "8.0.39"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "yourpassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.rds_allow_sql.id]

  tags = {
    Name = "gaga"
  }
}

