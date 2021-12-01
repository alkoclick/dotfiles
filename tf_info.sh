#!/usr/bin/env bash

output=$(cat <<EOF
  {
  "host": "$HOSTNAME",
  "user": "$USERNAME"
  }
EOF
)

echo $output
