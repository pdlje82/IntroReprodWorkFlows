#!/bin/bash

# Update package lists and install nano
apt update && apt install -y nano

# Function to display the Git branch
echo 'parse_git_branch() {
   git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}' >> ~/.bashrc

# Modify the PS1 variable
echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc

# Source .bashrc to apply changes so far
source ~/.bashrc

# change to working directory
cd /workspace/IntroReprodWorkFlows/


