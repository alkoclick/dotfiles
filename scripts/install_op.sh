#!/usr/bin/env bash

set -e

curl https://cache.agilebits.com/dist/1P/op/pkg/$VERSION/op_linux_amd64_$VERSION.zip --output op.zip
unzip op.zip
sudo mv op /usr/local/bin/op
rm op.*
