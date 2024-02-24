#!/bin/bash -v

# Make updates run with minimal prompting for input
export DEBIAN_FRONTEND=noninteractive

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y

# Update any packages managed by snap.
which snap && sudo snap refresh

sudo apt autoremove --purge -y
sudo apt clean
