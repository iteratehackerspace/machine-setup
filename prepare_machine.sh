#!/bin/bash

set -euo pipefail

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

wget https://github.com/atom/atom/releases/download/v1.10.2/atom-amd64.deb

dpkg -i atom-amd64.deb

# Things for code completion
su - iterate -c "npm install tern -g"
pip3 install jedi

npm install react atom-ternjs autocomplete-python
