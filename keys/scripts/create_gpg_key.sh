#!/usr/bin/env bash

set -e

gpg --batch --gen-key <<EOF
  Key-Type: default
  Key-Length: 3072
  Subkey-Type: default
  Subkey-Length: 3072
  Name-Real: $NAME
  Name-Comment: $ID
  Name-Email: $EMAIL
  Passphrase: $PASSPHRASE
  Expire-Date: 365
EOF

echo $(cat <<EOF
  {
  "pub": "$(gpg --list-signatures --with-colons "$ID" | grep pub | cut -d : -f 5)"
  }
EOF
)
