#!/bin/bash

# Update package lists and install nano
apt update && apt install -y nano

# Function to display the Git branch
echo 'parse_git_branch() {
   git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}' >> ~/.bashrc

# Modify the PS1 variable
echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc

# Adjust PATH and initialize conda
echo 'export PATH="/workspace/miniforge3/bin:$PATH"' >> ~/.bashrc

# Add conda initialization to .bashrc
echo 'conda init bash || true' >> ~/.bashrc

# Add mamba initialization to .bashrc
echo 'mamba init bash || true' >> ~/.bashrc

# Create symlink to make 'conda' command use 'mamba'
CONDA_PATH="/workspace/miniforge3/bin/conda"
if [ -f "$CONDA_PATH" ] && [ ! -L "$CONDA_PATH" ]; then
    mv $CONDA_PATH ${CONDA_PATH}_backup
    ln -s $(which mamba) $CONDA_PATH
fi

echo "Script has finished setting up. Please run 'source ~/.bashrc' and then 'mamba activate IntroReproducibleWF' manually."
