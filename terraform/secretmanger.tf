
#---------------create secrets Manager -----------------
resource "aws_secretsmanager_secret" "secrets_manager" {
  name = "secretskeys"
  rotation_rules {
    automatically_after_days = 0
  }
}

#------------------- export private ssh key to secrets managers-------------
resource "aws_secretsmanager_secret_version" "privatekey" {
  secret_id     = aws_secretsmanager_secret.secrets_manager.id
  secret_string = tls_private_key.private_key.private_key_pem

}


resource "random_password" "random"{
  length           = 16
  special          = false
}

resource "aws_secretsmanager_secret" "password" {
  name = "rdspassword"
  rotation_rules {
    automatically_after_days = 0
  }
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id = aws_secretsmanager_secret.password.id
  secret_string = random_password.random.result
}