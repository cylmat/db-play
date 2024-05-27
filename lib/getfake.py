import json, random
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
        "int": random.randint(100, 900)
    } 
    return json.dumps(obj)

def generate_arr():
    return json.loads(generate())