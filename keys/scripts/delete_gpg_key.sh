#!/usr/bin/env bash

set -e

# Depending on the deletion order, each one of these commands may have 1 failure and 1 success.
# This is because there is both a primary key and a subkey returned.
# Deleting the primary also cascades into subkey deletion, so attempting to delete it after fails.
# Possible improvement is to find a way to only filter the primary somehow - Good luck lol
gpg --list-keys --with-colons --fingerprint "$ID" | grep fpr | cut -d : -f 10 | xargs gpg --batch --delete-keys
gpg --list-secret-keys --with-colons --fingerprint "$ID" | grep fpr | cut -d : -f 10 | xargs gpg --batch --delete-secret-keys

