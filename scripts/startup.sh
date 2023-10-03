#!/bin/bash

# Update package lists and install nano
apt update && apt install -y nano

# Add stuff to bashrc
# Function to display the Git branch
echo 'parse_git_branch() {
   git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}' >> ~/.bashrc

# Modify the PS1 variable
echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc

# always let MLflow use the base mamba installation
echo 'export MLFLOW_CONDA_HOME="/workspace/miniforge3/"' >> ~/.bashrc
# set mamba as conda executable for MLflow
echo 'export MLFLOW_CONDA_CREATE_ENV_CMD="mamba"' >> ~/.bashrc

source ~/.bashrc

# change to working directory
cd /workspace/IntroReprodWorkFlows/


