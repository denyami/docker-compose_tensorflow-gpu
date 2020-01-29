build:
	docker-compose build
up:
	docker-compose up -d
exec:
	docker-compose exec pro_tensorflow /bin/bash
entry:
	make build
	make up
	make exec

