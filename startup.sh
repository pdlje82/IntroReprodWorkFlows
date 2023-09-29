#!/bin/bash

# Function to add content to .bashrc if it doesn't already exist
add_to_bashrc() {
    local content="$1"
    if ! grep -qF -- "$content" ~/.bashrc; then
        echo "$content" >> ~/.bashrc
    fi
}

# Update package lists and install nano
apt update && apt install -y nano

# Add Git branch display function and modify PS1 variable
add_to_bashrc 'parse_git_branch() { git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"; }'
add_to_bashrc 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "'

# Adjust PATH
add_to_bashrc 'export PATH="/workspace/miniforge3/bin:$PATH"'

# Initialize conda
add_to_bashrc 'conda init bash || true'
source ~/.bashrc
source ~/.bashrc

# Initialize mamba
add_to_bashrc 'mamba init bash || true'
source ~/.bashrc

mamba activate IntroReproducibleWF