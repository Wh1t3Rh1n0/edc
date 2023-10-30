#!/bin/bash

cat bashrc_options.txt >> ~/.bashrc

cat screenrc_options.txt >> ~/.screenrc

sudo usermod -s $(which bash) $(whoami)
