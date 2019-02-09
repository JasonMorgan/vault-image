#!/bin/sh
cat > /vault/config/vault.hcl <<EOF

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}

# storage "file" {
#   path = "/vault/data"
# }

storage "s3" {
  access_key = "$AWS_ACCESS_KEY_ID"
  secret_key = "$AWS_SECRET_ACCESS_KEY"
  bucket     = "$AWS_S3_BUCKET"
}

ui = true

EOF

vault server -config /vault/config/vault.hcl