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

# Adjust PATH and initialize conda and mamba
add_to_bashrc 'export PATH="/workspace/miniforge3/bin:$PATH"'
add_to_bashrc 'conda init bash || true' # || true ensures the script continues even if conda init fails
add_to_bashrc 'mamba init bash || true'

# Reload the .bashrc file for the subsequent commands in this script
source ~/.bashrc

# Activate the conda environment
mamba activate IntroReproducibleWF

# Note: You don't need to reload the .bashrc file again at the end because 
# the changes will take effect in new terminals or when you source ~/.bashrc manually.
