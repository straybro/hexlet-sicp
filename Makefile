test:
	composer run phpunit

setup: env-prepare install key sqlite-prepare

install:
	composer install
	npm install

start:
	heroku local -f Procfile.dev

analyse:
	php artisan code:analyse

lint:
	composer phpcs

fix-lint:
	composer phpcbf

deploy:
	git push heroku master

env-prepare:
	cp -n .env.example .env || true

sqlite-prepare:
	touch database/database.sqlite

key:
	php artisan key:generate

.PHONY: test
