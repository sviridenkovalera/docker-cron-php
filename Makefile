build:
	docker build -t cowrvalera/docker-apache-php:v1.0.0 --platform linux/amd64 .


run_dev:
	docker-compose up -d

stop_dev:
	docker-compose down