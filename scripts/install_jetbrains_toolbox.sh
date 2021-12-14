#!/bin/bash

# Adapted from https://github.com/nagygergo/jetbrains-toolbox-install
set -e

function getLatestUrl() {
USER_AGENT=('User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36')

URL=$(curl 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' -H 'Origin: https://www.jetbrains.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.8' -H "${USER_AGENT[@]}" -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.jetbrains.com/toolbox/download/' -H 'Connection: keep-alive' -H 'DNT: 1' --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')
echo $URL
}
getLatestUrl

DEST=$PWD/$(basename ${URL})
wget -cO  ${DEST} ${URL} --read-timeout=5 --tries=0

sudo mkdir $INSTALL_DIR
sudo tar -xzf ${DEST} -C ${INSTALL_DIR} --strip-components=1
sudo chown -R ${USER} ${INSTALL_DIR}
touch ${INSTALL_DIR}/jetbrains-toolbox.sh
echo '#!/bin/bash' >> $INSTALL_DIR/jetbrains-toolbox.sh
echo "$INSTALL_DIR/jetbrains-toolbox \$@" >> $INSTALL_DIR/jetbrains-toolbox.sh

sudo ln -s ${INSTALL_DIR}/jetbrains-toolbox.sh /usr/local/bin/jetbrains-toolbox
sudo chmod -R +rwx /usr/local/bin/jetbrains-toolbox
rm ${DEST}

echo "{\"version\":\"$(jetbrains-toolbox --version)\"}"

# MIT License
#
#Copyright (c) 2016 Gergely Nagy
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
