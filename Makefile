build-%:
	$(eval FUNCTION_NAME := $(shell echo $* | sed -E 's/(.)([A-Z])/\1_\2/g' | tr '[A-Z]' '[a-z]'))
	docker-compose run --rm -u `id -u`:`id -g` -e BIN=$(FUNCTION_NAME) develop
	cp ./target/lambda/release/output/$(FUNCTION_NAME)/bootstrap $(ARTIFACTS_DIR)
