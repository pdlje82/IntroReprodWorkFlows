git clone https://github.com/pdlje82/IntroReprodWorkFlows.git

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh -u -b -p /workspace/miniconda3

export PATH="/workspace/miniconda3/bin:$PATH"
conda init bash
source ~/.bashrc


conda clean --all
conda create --name IntroReproducibleWF python=3.8 mlflow jupyter pandas matplotlib requests -c conda-forge

conda activate IntroReproducibleWF

pip install wandb==0.10.29
wandb login
