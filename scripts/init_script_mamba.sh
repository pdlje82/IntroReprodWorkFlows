apt update
apt install nano

cd /workspace

# Clone the repository if it doesn't exist
if [ ! -d "IntroReprodWorkFlows" ]; then
    git clone https://github.com/pdlje82/IntroReprodWorkFlows.git
fi

# Download and install Miniforge if it doesn't exist
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh -b -p /workspace/miniforge3

# Adjust PATH and initialize conda
echo 'export PATH="/workspace/miniforge3/envs/IntroReproducibleWF/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="/workspace/miniforge3/bin:$PATH"' >> ~/.bashrc
conda init bash
source ~/.bashrc

# Clean conda cache
conda clean --all -y

# Function to display the Git branch
echo 'parse_git_branch() {
   git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"}' >> ~/.bashrc

# Modify the PS1 variable
echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "' >> ~/.bashrc

cp ~/.bashrc /workspace/IntroReprodWF/.bashrc

# Update package lists and install nano
apt update && apt install -y nano

#  use mamba to create environment
mamba create --name IntroReproducibleWF python=3.8 mamba mlflow jupyter pandas matplotlib requests -c conda-forge -y

conda activate IntroReproducibleWF

# Define the path to the bin directory of the environment
s
ENV_BIN_PATH="/workspace/miniforge3/envs/IntroReproducibleWF/bin"

# Navigate to the bin directory
cd $ENV_BIN_PATH

# Rename the conda executable to conda_backup only if it's not a symlink
if [ -f "conda" ] && [ ! -L "conda" ]; then
    mv conda conda_backup
fi

# Create a symbolic link named conda that points to mamba
ln -s mamba conda

echo "Symlink created successfully!"
