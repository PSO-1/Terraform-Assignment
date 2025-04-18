# Web Server 1
resource "aws_instance" "web1" {
  ami           = "ami-0d79dee6fcbdf37d0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_a.id
  key_name      = "meg1"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data     = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Welcome to Web Server 1</h1>" | sudo tee /var/www/html/index.html
                EOF
  tags = { Name = "WebServer1" }
}

# Web Server 2
resource "aws_instance" "web2" {
  ami           = "ami-0d79dee6fcbdf37d0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_b.id
  key_name      = "meg1"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  user_data     = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Welcome to Web Server 2</h1>" | sudo tee /var/www/html/index.html
                EOF
  tags = { Name = "WebServer2" }
}

# MySQL Database
resource "aws_instance" "db" {
  ami           = "ami-0d79dee6fcbdf37d0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  key_name      = "meg1"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  tags = { Name = "MySQL-DB" }
}
