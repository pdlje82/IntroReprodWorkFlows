#!/bin/bash

# initialize conda & mamba
# Adjust PATH and initialize conda
echo 'export PATH="/workspace/miniforge3/envs/IntroReproducibleWF/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="/workspace/miniforge3/bin:$PATH"' >> ~/.bashrc
conda init bash
source ~/.bashrc

# activate environment
conda activate IntroReproducibleWF

# create symlink


echo "Symlink created successfully!"

