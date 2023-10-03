# Update package lists and install nano
apt update && apt install -y nano

# Function to display the Git branch
echo 'parse_git_branch() {
   git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}' >> ~/.bashrc

# Modify the PS1 variable
echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc
source ~/.bashrc

# Clone the repository if it doesn't exist
cd /workspace
if [ ! -d "IntroReprodWorkFlows" ]; then
    git clone https://github.com/pdlje82/IntroReprodWorkFlows.git
fi

# Download and install Miniforge if it doesn't exist
# Install everything in /workspace (runpod.io)
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p /workspace/miniforge3

# Adjust PATH and
echo 'export PATH="/workspace/miniforge3/bin:$PATH"' >> ~/.bashrc

# always let MLflow use the base mamba installation
echo 'export MLFLOW_CONDA_HOME="/workspace/miniforge3/"' >> ~/.bashrc
# set mamba as conda executable for MLflow
echo 'export MLFLOW_CONDA_CREATE_ENV_CMD="mamba"' >> ~/.bashrc
source ~/.bashrc

# initialize conda
conda init bash
source ~/.bashrc

# Clean conda cache
conda clean --all -y

#  use mamba to create environment
mamba create --name RepWF python=3.8 mlflow -c conda-forge -y

conda activate RepWF
