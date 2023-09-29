#!/bin/bash


# Initialize mamba
mamba init bash

# Source .bashrc again to have mamba changes take effect
source ~/.bashrc

mamba activate IntroReproducibleWF

# Create symlink to make 'conda' command use 'mamba'
CONDA_PATH="/workspace/miniforge3/bin/conda"
if [ -f "$CONDA_PATH" ] && [ ! -L "$CONDA_PATH" ]; then
    mv $CONDA_PATH ${CONDA_PATH}_backup
    ln -s $(which mamba) $CONDA_PATH
fi
