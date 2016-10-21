#!/bin/bash

scp -r root@riem:/home/gast/* roles/useraccounts/files/etc/skel
scp -r root@riem:/home/gast/.* roles/useraccounts/files/etc/skel
git rm -r roles/useraccounts/files/etc/skel/.cache/
git rm -r roles/useraccounts/files/etc/skel/.Xauthority
git rm -r roles/useraccounts/files/etc/skel/.xsession-errors
git rm -r roles/useraccounts/files/etc/skel/.dbus/session-bus/*

git add -A
git commit -a -m "Updated Skel"
