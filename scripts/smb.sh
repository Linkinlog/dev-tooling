#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Add Coding share -- Comment out if not needed
sudo mkdir /media/Coding 2>/dev/null
grep -q '/media/Coding' /etc/fstab ||
sudo su -c "printf '//192.168.0.11/Coding  /media/Coding/  cifs   credentials=$SCRIPT_DIR/../configs/creds,uid=1000,gid=1000,iocharset=utf8,vers=2.0  0  0' >> /etc/fstab"
