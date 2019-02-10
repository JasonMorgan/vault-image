#!/bin/sh
AWS_ACCESS_KEY_ID=$(echo \"""${AWS_ACCESS_KEY_ID//[$'\t\r\n ']}"\"")
AWS_SECRET_ACCESS_KEY=$(echo \"""${AWS_SECRET_ACCESS_KEY//[$'\t\r\n ']}"\"")

cat > /vault/config/vault.hcl <<EOF

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}

# storage "file" {
#   path = "/vault/data"
# }

storage "s3" {
  access_key = $AWS_ACCESS_KEY_ID
  secret_key = $AWS_SECRET_ACCESS_KEY
  bucket     = "$AWS_S3_BUCKET"
}

ui = true

EOF

cat /vault/config/vault.hcl
vault server -config /vault/config/vault.hcl