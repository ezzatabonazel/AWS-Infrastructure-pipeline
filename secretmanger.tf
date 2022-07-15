resource "aws_secretsmanager_secret" "secret" {
  name  = "rotation-example"

  rotation_rules {
    automatically_after_days = 0
  }
}

resource "aws_secretsmanager_secret_version" "privatekey" {
   secret_id = aws_secretsmanager_secret.secret.id
  secret_string     = tls_private_key.private_key.private_key_pem

}