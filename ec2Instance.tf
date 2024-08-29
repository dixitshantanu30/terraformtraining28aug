# ec2_instance.tf

resource "aws_instance" "web_server" {
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.web_subnet.id
  associate_public_ip_address = true

  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "shanWebSrv"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install nginx1.12 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

output "instance_name" {
  value = aws_instance.web_server.tags["Name"]
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "private_ip" {
  value = aws_instance.web_server.private_ip
}
