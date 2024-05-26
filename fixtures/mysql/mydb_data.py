import os, subprocess, json

fake = json.loads(subprocess.check_output(['python3', '/var/www/scripts/getfake.py']))

name = fake['name']
sql = "INSERT INTO `tree` (`name`, `type`, `size`) VALUES('" + name + "', 'green', 305);"

f = open(os.path.dirname(__file__) + '/mydb_data.sql', 'w')
f.write(sql)
f.close()
