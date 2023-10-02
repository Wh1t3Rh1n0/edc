#!/bin/bash

cat bashrc_options.txt >> ~/.bashrc

sudo usermod -s $(which bash) $(whoami)