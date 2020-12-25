#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install mtod from git
if [ ! -d motd ]; then
    git clone git@github.com:yboetz/motd.git
else
    pushd motd
    git pull
    popd
fi

files=(\
    20-sysinfo \
    35-diskspace \
    60-docker \
)

for f in "${files[@]}"; do
    sudo cp motd/${f} /etc/update-motd.d/
done;
