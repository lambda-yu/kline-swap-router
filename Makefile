URL?=http://localhost:8545

install-deps:
	@echo " > \033[32mInstalling dependencies... \033[0m "
	yarn

install-cli: compile
	@echo " > \033[32mInstalling cb-sol-cli... \033[0m "
	npm link ./cli 

.PHONY: test
test:
	@echo " > \033[32mTesting contracts... \033[0m "
	yarn test

compile:
	@echo " > \033[32mCompiling contracts... \033[0m "
	yarn compile

clean:
	@echo " > \033[32mClean contracts... \033[0m "
	yarn clean

start-ganache:
	@echo " > \033[32mStarting ganache... \033[0m "
	./scripts/start_ganache.sh

start-geth:
	@echo " > \033[32mStarting geth... \033[0m "
	./scripts/geth/start_geth.sh

bindings: compile
	@echo " > \033[32mCreating go bindings for ethereum contracts... \033[0m "
	./scripts/create_bindings.sh
