#!/bin/bash

install:
	git clone https://github.com/Nessiahs/file-exchange-backend.git ./api
	git clone https://github.com/Nessiahs/file-exchange-ui.git ./gui

up:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker exec -i api sh -c 'cd /var/api/ && ./node_modules/.bin/pm2 restart backend'

compile:
	make compilegui
	make compileapi

compileapi:
	docker exec -i api sh -c 'cd /var/api && yarn install && yarn build'

compilegui:
	docker exec -i compile sh -c 'cd /var/gui && yarn install && yarn build'

api-start:
	docker exec -i api sh -c 'cd /var/api/ && ./node_modules/.bin/pm2 start ./dist --name "backend"'

first:
	make up
	make compile
	make api-start

start:
	make up
	make api-start

updategui:
	cd ./gui && git pull
	make compilegui

updateapi:
	cd ./api && git pull
	make compileapi
	make restart
