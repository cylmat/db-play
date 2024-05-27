import os

FIXTURE_PATH = os.path.dirname(__file__) + '/../fixtures/'

def append_file(dbtype: str, name: str, text: str) -> None:
    file = f"{FIXTURE_PATH}{dbtype}/{name}"
    f = open(file, 'w')
    f.write(text)
    f.close()