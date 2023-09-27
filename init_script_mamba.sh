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
export PATH="/workspace/miniforge3/bin:$PATH"
conda init bash
source ~/.bashrc

# Clean conda cache
conda clean --all

mamba init bash
source ~/.bashrc

ln -s $(which mamba) /workspace/miniforge3/bin/conda


mamba create --name IntroReproducibleWF python=3.8 mlflow jupyter pandas matplotlib requests -c conda-forge
