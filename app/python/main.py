from flask import Flask

# Create Flash server
from app.python.utils import get_datetime, read_yaml, read_text, get_quotes, choose_quotes
from app.python.logger import logger
from app.python.envs import SERVER_HOST, config_file, text_file

flask_app = Flask(__name__)
config = read_yaml(config_file)
lines = read_text(text_file)
quotes = get_quotes(lines)

# Routes
@flask_app.route("/")
def main():
    logger.setup_logger("flask-python")
    datetime = get_datetime()
    result = "Current time is {} \n".format(datetime)
    result = result + choose_quotes(quotes)
    logger.info("Received a request on {}".format(datetime))
    return result


if __name__ == "__main__":
    SERVER_PORT = config["server_port"]
    flask_app.run(host=SERVER_HOST, port=SERVER_PORT)
