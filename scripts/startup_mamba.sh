#!/bin/bash


# Adjust PATH and initialize conda
echo 'export PATH="/workspace/miniforge3/bin:$PATH"' >> ~/.bashrc

# set mamba as conda executable for MLflow
echo 'export MLFLOW_CONDA_HOME="/workspace/miniforge3/envs/RepWF/"' >> ~/.bashrc
echo 'export MLFLOW_CONDA_CREATE_ENV_CMD="mamba"' >> ~/.bashrc
source ~/.bashrc

conda init bash
source ~/.bashrc

# activate environment
conda activate RepWF


