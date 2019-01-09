#!/bin/sh
cat > /vault/config/vault.hcl <<EOF
listener "tcp" {
  address = "0.0.0.0:8200"
}

storage "s3" {
}

ui = true
EOF

vault server -config /vault/config/vault.hcl