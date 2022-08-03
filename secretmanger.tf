
#---------------create secrets Manager -----------------
resource "aws_secretsmanager_secret" "secrets_manager" {
  name = "secret-key"
  rotation_rules {
    automatically_after_days = 0
  }
}

#------------------- export private ssh key to secrets managers-------------
resource "aws_secretsmanager_secret_version" "privatekey" {
  secret_id     = aws_secretsmanager_secret.secrets_manager.id
  secret_string = tls_private_key.private_key.private_key_pem

}