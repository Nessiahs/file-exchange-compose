#!/bin/bash

install:
	git clone https://github.com/Nessiahs/file-exchange-backend.git ./api
	git clone https://github.com/Nessiahs/file-exchange-ui.git ./gui

update:
	cd ./api && git pull

start:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker exec -it node_api sh -c 'cd /var/api/ && ./node_modules/.bin/pm2 restart backend'

serve:
	docker exec -it node_api sh -c 'cd /var/api && yarn install && yarn build'
	docker exec -it node_api sh -c 'cd /var/api/ && ./node_modules/.bin/pm2 start ./dist -name "backend"'
