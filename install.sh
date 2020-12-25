#!/bin/bash

# install some dependenciesA
sudo apt install \
    figlet \
    hddtemp

# Install mtod from git
if [ ! -d motd ]; then
    git clone git@github.com:yboetz/motd.git
else
    pushd motd
    git pull
    popd
fi

files=(\
    10-hostname \
    20-sysinfo \
    20-uptime \
    35-diskspace \
    36-diskstatus \
    40-services \
    60-docker \
)

for f in "${files[@]}"; do
    sudo cp motd/${f} /etc/update-motd.d/
done;
