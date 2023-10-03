import mlflow
import os
import wandb
import hydra
from omegaconf import DictConfig


# This automatically reads in the configuration
@hydra.main(config_name='config')
def go(config: DictConfig):

    # Setup the wandb experiment. All runs will be grouped under this name
    os.environ["WANDB_PROJECT"] = config["main"]["project_name"]
    os.environ["WANDB_RUN_GROUP"] = config["main"]["experiment_name"]

    # You can get the path at the root of the MLflow project with this:
    root_path = hydra.utils.get_original_cwd()

    _ = mlflow.run(
        os.path.join(root_path, "00_download_data"),
        "main",
        parameters={
            "file_url":             config["data_set"]["file_url"],         # input data
            "artifact_name":        config["data_set"]["artifact_name"],
            "artifact_type":        config["data_set"]["artifact_type"],
            "artifact_description": config["data_set"]["artifact_description"]
        },
    )


if __name__ == "__main__":
    go()