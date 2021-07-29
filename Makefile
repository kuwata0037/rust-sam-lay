build: build-HelloRustFunction

build-HelloRustFunction:
	docker-compose run --rm -u `id -u`:`id -g` foo
	cp ./target/lambda/release/output/rust-sam-lay/bootstrap $(ARTIFACTS_DIR)
