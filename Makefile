SHELL := /bin/bash

docker:
	docker compose -f "docker-compose.yml" up -d --build 

symfony-cli:
	wget https://get.symfony.com/cli/installer -O - | bash
# url -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
# sudo apt install symfony-cli

omz:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch