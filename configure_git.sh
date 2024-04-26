#!/bin/bash

read -p "Enter your fullname: " fullname
read -p "Enter your Github email: " email

echo 'Configuring git'
git config --global user.name "$fullname"
git config --global user.email "$email"

ssh-keygen -t ed25519 -C "$email"

echo ''
echo 'Copy this token and paste on github ssh session'
cat ~/.ssh/id_ed25519.pub
