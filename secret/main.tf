provider "aws" {
  region = "eu-west-2"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

provider "vault" {
  auth_login {
    path = auth / userpass / login / var.username
    parameters = {
      password = var.password
    }
  }
}

data "vault_generic_secret" "dbuser" {
  path = "secret/dbuser"
}

data "vault_generic_secret" "dbpassword" {
  path = "secret/dbpassword"
}

resource "aws_db_instance" "myRDS" {
  name                = "mydb"
  identifier          = "my-first-rds"
  instance_class      = "db.t2.micro"
  engine              = "mariadb"
  engine_version      = "10.2.21"
  username            = data.dbuser.data["value"]
  password            = data.dbpassword.data["value"]
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}
