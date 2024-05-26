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

fixtures:
	@${MAKE} --no-print-directory f_mysql

f_mysql:
# test: docker exec mysql8 mysql -u user mydb --execute 'SELECT * FROM tree'
	docker exec mysql8 sh -c "mysql -u user mydb --execute 'TRUNCATE TABLE tree'"
	docker exec dbplay python3 /var/www/fixtures/mysql/mydb_data.py
	docker exec mysql8 sh -c "mysql -u user mydb < /var/www/fixtures/mysql/mydb_data.sql"

###########
# INSTALL #
###########

symfony-cli:
	wget https://get.symfony.com/cli/installer -O - | bash
# url -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
# sudo apt install symfony-cli

omz:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch