<<<<<<< HEAD
provider "aws" {
  region = var.aws_region
}

# ✅ Use the default VPC directly
data "aws_vpcs" "available" {}

data "aws_vpc" "default" {
  id = data.aws_vpcs.available.ids[0]
}

# ✅ Security Group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH, HTTP, and app ports"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Jenkins EC2 Instance
resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "awskey"  # Reusing existing key
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "Jenkins-Server"
  }
}

# ✅ App EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "awskey"  # Reusing existing key
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "App-Server"
  }
}

# ✅ MySQL RDS Instance
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.35"                     # ✅ Supported version
  instance_class       = "db.t3.micro"                # ✅ Supported instance type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "MySQL-DB"
  }
}
=======
provider "aws" {
  region = var.aws_region
}

# ✅ Use the default VPC directly
data "aws_vpcs" "available" {}

data "aws_vpc" "default" {
  id = data.aws_vpcs.available.ids[0]
}

# ✅ Security Group
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH, HTTP, and app ports"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Jenkins EC2 Instance
resource "aws_instance" "jenkins_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "awskey"  # Reusing existing key
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "Jenkins-Server"
  }
}

# ✅ App EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "awskey"  # Reusing existing key
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  tags = {
    Name = "App-Server"
  }
}

# ✅ MySQL RDS Instance
resource "aws_db_instance" "mysql" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.35"                     # ✅ Supported version
  instance_class       = "db.t3.micro"                # ✅ Supported instance type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "MySQL-DB"
  }
}
>>>>>>> 05fc064 (Re-added infra folder as normal directory)
