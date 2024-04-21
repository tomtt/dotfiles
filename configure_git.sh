#!/bin/bash

echo 'Configuring git'
git config --global user.name "Murilo Romeo"
git config --global user.email "muriloh65@gmail.com"

ssh-keygen -t ed25519 -C "muriloh65@gmail.com"

echo ''
echo 'Copy this and paste on github'
cat ~/.ssh/id_ed25519.pub
