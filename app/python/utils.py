import datetime
import yaml
import random


def read_yaml(file_path):
    with open(file_path, "r") as stream:
        try:
            data = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)
    return data


def read_text(file_path):
    with open(file_path, "r") as f:
        lines = f.readlines()
    return lines


def get_quotes(lines):
    quotes = []

    group_lines = []
    for line in lines:
        if line != "\n":
            group_lines.append(line)
        else:
            quotes.append(group_lines)
            group_lines = []
    if group_lines:
        quotes.append(group_lines)
    return quotes


def choose_quotes(quotes):
    quote = random.choice(quotes)
    return " ".join(quote)


def get_datetime():
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
