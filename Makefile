SHELL := /bin/bash

#######
# USE #
#######

up:
	docker compose -f 'docker-compose.yml' up -d
	@${MAKE} --no-print-directory _ok

down:
	docker compose -f 'docker-compose.yml' down --remove-orphans

restart:
	${MAKE} up
	${MAKE} down 

_ok:
	@echo ""
	@echo "Mongo[27017] - MySql[3306] - Redis[6379]"
	@echo "Adminer    on http://localhost:8081?server=mysql&username=user&password=pass&db=mydb"
	@echo "Min.io     on http://localhost:9000"
	@echo  Mongo      on http://localhost:8085"
	@echo "Phpmyadmin on http://localhost:8082"
	@echo "Redis      on http://localhost:8083"

doc:
	@echo "Documentation"
	@echo "Min.io : https://min.io/docs"
	@echo "MongoDb : https://mongodb.com/docs"
	@echo "MySql : https://mysql.com/doc"
	@echo "Redis : https://redis.io/docs"

#####################
#     FIXTURES      #
#####################

### GENERATE ###

gen:
	${MAKE} f_minio_gen
	${MAKE} f_mysql_gen

f_minio_gen:
	docker exec dbplay python3 /var/www/fixtures/_generate/minio_data_sample.py

f_mysql_gen:
	docker exec dbplay python3 /var/www/fixtures/_generate/mysql_mydb_data.py

### MIN.IO ###

f_minio: #rb(rem bucket) / mb (make bucket)
	docker exec minio_mc sh -c "mc rb --force --dangerous myminio/alpha"
	docker exec minio_mc sh -c "mc mb myminio/alpha"
	docker exec minio_mc sh -c "mc rm --recursive --force myminio/alpha"
	docker exec minio_mc sh -c "mc cp /var/www/fixtures/minio/data_sample myminio/alpha"

### MONGO ###

f_mongo:
#	mongosh -u user -p pass myBase --authenticationDatabase admin -f /var/www/fixtures/mongo/data.mongodb
#	mongosh mongodb://user:pass@localhost:27017/myBase file.js
	docker exec mongo sh -c "mongosh -u user -p pass myBase --authenticationDatabase admin -f /var/www/fixtures/mongo/data.mongodb"

### MYSQL ###

f_mysql:
	docker exec mysql8 sh -c "mysql mydb --execute 'TRUNCATE TABLE tree'"
	docker exec mysql8 sh -c "mysql mydb < /var/www/fixtures/mysql/mydb_data.sql"

### REDIS ###

f_redis:
	docker exec redis sh -c "redis-cli FLUSHALL"
	docker exec redis sh -c "redis-cli < /var/www/fixtures/redis/data"

#################
#   COMMANDS    #
# & docs        #
#################

# https://min.io/docs/minio/linux/reference/minio-mc.html
minio_get:
	docker exec minio_mc sh -c "mc ls myminio/alpha"

# https://dev.mysql.com/doc/refman/8.4/en
mysql_get:
	docker exec mysql8 sh -c "mysql mydb -e 'SELECT * FROM tree'"

# https://redis.io/docs
redis_get:
	docker exec redis sh -c "redis-cli KEYS \*"

#################
#    INSTALL    #
#################

symfony-cli:
	wget https://get.symfony.com/cli/installer -O - | bash
# url -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
# sudo apt install symfony-cli

omz:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch