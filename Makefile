build:
	docker build -t cowrvalera/docker-cron-php:1.4.0 --platform linux/amd64 .

run_dev:
	docker-compose up -d

stop_dev:
	docker-compose down