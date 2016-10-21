#!/bin/bash

if [ $# -eq 0 ] ; then
  echo "No hostname given, using riem"
  hostname=riem
elif [ $# -eq 1 ] ; then
  echo "Using $1 as source-host"
  hostname=$1
else
  echo "Wrong usage"
  echo ""
  echo "$0 [hostname]"
  exit
fi

scp -r root@${hostname}:/home/gast/* roles/useraccounts/files/etc/skel
scp -r root@${hostname}:/home/gast/.* roles/useraccounts/files/etc/skel
git rm -rf roles/useraccounts/files/etc/skel/.cache/
git rm -rf roles/useraccounts/files/etc/skel/.Xauthority
git rm -rf roles/useraccounts/files/etc/skel/.xsession-errors
git rm -rf roles/useraccounts/files/etc/skel/.dbus/session-bus/*

git add -A
git commit -a -m "Updated Skel"
ansible-playbook main.yml -t skel
