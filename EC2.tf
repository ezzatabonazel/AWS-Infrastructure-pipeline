data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public1.id
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "pastion-ec2"
  }

   provisioner "local-exec" {
    command = "echo ${self.public_ip} ${var.region} >> public_ips.txt"
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private2.id
  key_name = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "application-ec2"
  }
}
