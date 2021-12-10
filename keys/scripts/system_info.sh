#!/usr/bin/env bash

echo $(cat <<EOF
  {
  "host": "$HOSTNAME",
  "user": "$USERNAME"
  }
EOF
)
