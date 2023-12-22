build:
	docker build -t cowrvalera/docker-cron-php:v1.2.0 --platform linux/amd64 .


run_dev:
	docker-compose up -d

stop_dev:
	docker-compose down