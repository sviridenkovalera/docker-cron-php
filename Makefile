build:
	docker build -t cowrvalera/docker-cron-php:v1.3.0 --platform linux/amd64 .


run_dev:
	docker-compose up -d

stop_dev:
	docker-compose down