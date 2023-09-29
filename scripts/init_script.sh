apt update
apt install nano

cd /workspace

# Clone the repository if it doesn't exist
if [ ! -d "IntroReprodWorkFlows" ]; then
    git clone https://github.com/pdlje82/IntroReprodWorkFlows.git
fi

# Download and install Miniconda if it doesn't exist
if [ ! -d "/workspace/miniconda3" ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -u -b -p /workspace/miniconda3
    rm Miniconda3-latest-Linux-x86_64.sh
fi

# Adjust PATH and initialize conda
export PATH="/workspace/miniconda3/bin:$PATH"
conda init bash
source ~/.bashrc

# Clean conda cache
conda clean --all

# Install mamba
conda update -n base -c defaults conda
conda install mamba -c conda-forge

mamba activate IntroReproducibleWF