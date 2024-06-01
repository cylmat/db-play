import os

FIXTURE_PATH = os.path.dirname(__file__) + '/../fixtures/'

def append_file(dbtype: str, name: str, text: str) -> None:
    file = f"{FIXTURE_PATH}{dbtype}/{name}"
    f = open(file, 'w')
    f.write(text)
    f.close()

def loop_fct(callback_str: callable, sep: str = "\n", repeat: int = 1):
    chaine = ''
    for _ in range(repeat):
        hit = '' if _ == repeat-1 else sep
        chaine += callback_str() + hit
    return chaine