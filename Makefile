build-HelloRustFunction:
	docker-compose run --rm -u `id -u`:`id -g` -e BIN=hello_rust_function -e PACKAGE=false devlop
	cp ./target/lambda/release/output/hello_rust_function/bootstrap $(ARTIFACTS_DIR)
