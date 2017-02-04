#!/bin/bash

set -e

if [[ $UID -ne 0 ]]; then
  echo "Must be run as root"
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo "Usage:"
  echo "adduser.sh <username>"
  exit 1
fi

username="$1"
userhome="/mnt/share/home/$username"

samba-tool user add "$username"

sid=$(wbinfo --name-to-sid "$username" | cut -d\  -f1)
uid=$(wbinfo --sid-to-uid "$sid" | cut -d\  -f1)

mkdir -p "${userhome}"
chown ${uid}:${uid} "${userhome}"
chmod 770 "${userhome}"
