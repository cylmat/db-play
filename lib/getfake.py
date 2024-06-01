import json, random, re
from faker import Faker

# @doc FAKER
# https://faker.readthedocs.io/en/master
#
faker = Faker()

# SAMPLE
# curl http://api.open-notify.org/iss-now.json | jq '.'

def generate() -> str:
    obj = {
        "name": faker.name(),
        "address": faker.address(),
        "text": faker.text(),
        "word": faker.word(),
        "sentence": faker.sentence(),
        "int": random.randint(100, 900)
    } 
    return json.dumps(obj)

def generate_arr():
    return json.loads(generate())

def generate_replace(text: str) -> str:
    params = re.findall(r":[a-z0-9]+", text)
    for param in params:
        fake = generate_arr()
        text = text.replace(param, str(fake[param.replace(':', '')]), 1)
    return text