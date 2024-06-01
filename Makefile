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
	@echo "MySql[3306] - Redis[6379]"
	@echo "Adminer    on http://localhost:8081?server=mysql&username=user&password=pass&db=mydb"
	@echo "Phpmyadmin on http://localhost:8082"
	@echo "Redis      on http://localhost:8083"

############
# FIXTURES #
############

f_minio: #rb(rem bucket) / mb (make bucket)
	docker exec minio_mc sh -c "mc rb --force --dangerous myminio/alpha"
	docker exec minio_mc sh -c "mc mb myminio/alpha"
	docker exec minio_mc sh -c "mc rm --recursive --force myminio/alpha"
	docker exec minio_mc sh -c "mc cp /var/www/fixtures/minio/data_sample.txt myminio/alpha"
f_minio_gen:
	docker exec dbplay python3 /var/www/fixtures/generate/minio_data_sample.py

# test: docker exec mysql8 mysql -u user mydb --execute 'SELECT * FROM tree'
f_mysql:
	docker exec mysql8 sh -c "mysql mydb --execute 'TRUNCATE TABLE tree'"
	docker exec mysql8 sh -c "mysql mydb < /var/www/fixtures/mysql/mydb_data.sql"
f_mysql_gen:
	docker exec dbplay python3 /var/www/fixtures/generate/mysql_mydb_data.py

gen:
	${MAKE} f_minio_gen
	${MAKE} f_mysql_gen

###########
# INSTALL #
###########

symfony-cli:
	wget https://get.symfony.com/cli/installer -O - | bash
# url -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
# sudo apt install symfony-cli

omz:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch