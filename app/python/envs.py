import os

PROJECT_PATH = os.getenv("PROJECT_PATH")
SERVER_HOST = os.getenv("SERVER_HOST")

CONFIG_PATH = os.path.join(PROJECT_PATH, "config")
DATA_PATH = os.path.join(PROJECT_PATH, "data")
ENVS_PATH = os.path.join(PROJECT_PATH, "envs")
LOGS_PATH = os.path.join(PROJECT_PATH, "logs")

config_file = os.path.join(CONFIG_PATH, "config.yaml")
text_file = os.path.join(DATA_PATH, "quote.txt")
