#!/bin/bash
# TODO: Exit if something fails
# TODO: Check what's in .git
# TODO: Confirm we are logged into Deis

if [ ! -f config.json ]; then
  echo "This script cannot be used if there is no config.json"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: ./quickstart.sh <instance_name>"
  exit 1
fi

# Remove git stuff
rm -fr .git
rm README.md

# Install composer etc
./install.sh

# Init a new repo and add the required files
git init
git add composer.json composer.lock .gitignore .profile.d
git commit -m "Initial commit"

# Create the app
vendor/bin/setup_deis_instance $1 config.json

# Deploy
git push deis master

# Print logs
deis logs
