#!/bin/bash

set -uou pipefail

if [ "$(whoami)" != "root" ]; then
    printf "Must be run as sudo\n"
    exit -1
fi
# Bring system up to date
aptitude update
aptitude upgrade -y

# Essentials
aptitude install git python3-pip curl

# Nodejs
curl -sL https://deb.nodesource.com/setup_6.x | bash -
aptitude install nodejs -y

curl https://github.com/atom/atom/releases/download/v1.10.2/atom-amd64.deb

dpkg -i atom-amd64.deb

# Things for code completion
npm install tern -g
pip3 install tern

apm install react atom-ternjs autocomplete-python
