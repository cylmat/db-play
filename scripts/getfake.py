from faker import Faker
#import io
import json

# @doc FAKER
# https://faker.readthedocs.io/en/master
#
fake = Faker()

# @doc REAL-PYTHON
# https://realpython.com/run-python-scripts/

# SAMPLE
# curl http://api.open-notify.org/iss-now.json | jq '.'

name = fake.name()
adress = fake.address()
text = fake.text()

obj = {
    "name": name
} 
json = json.dumps(obj)

# print data
print(json)
