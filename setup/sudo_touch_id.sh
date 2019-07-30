#!/bin/sh

echo "Paste the following into /etc/pam.d/sudo"
echo "\tauth sufficient pam_tid.so"
