build: build-HelloRustFunction

build-HelloRustFunction:
	docker-compose run --rm -u `id -u`:`id -g` foo
