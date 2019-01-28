#!/bin/sh
cat > /vault/config/vault.hcl <<EOF
listener "tcp" {
  address = "0.0.0.0:8200"
}

storage "file" {
  path = "/vault/data"
}

diable_mlock = true

ui = true

EOF

cat /vault/config/vault.hcl
vault server -config /vault/config/vault.hcl