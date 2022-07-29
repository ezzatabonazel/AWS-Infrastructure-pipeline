resource "aws_db_instance" "mydb" {
  # Allocating the storage for database instance.
  allocated_storage = 10
  # Declaring the database engine and engine_version
  engine         = var.engine
  engine_version = var.engine_version
  # Declaring the instance class
  instance_class = var.instance_class
  name           = var.name
  # User to connect the database instance 
  username = var.username
  # Password to connect the database instance 
  password             = var.password
  parameter_group_name = var.parameter_group_name

  db_subnet_group_name = aws_db_subnet_group.subnets.id
  skip_final_snapshot  = true
}


resource "aws_db_subnet_group" "subnets" {

  name       = "main"
  subnet_ids = [module.network.private2_subnet_id, module.network.private1_subnet_id]

  tags = {
    Name = "My DB subnet group"
  }
}