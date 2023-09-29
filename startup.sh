apt update
apt install nano

# Adjust PATH and initialize conda
export PATH="/workspace/miniforge3/bin:$PATH"
conda init bash
source ~/.bashrc

mamba init bash
source ~/.bashrc