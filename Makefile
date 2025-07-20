
.DEFAULT_GOAL := help

.PHONY: help
help: # 各ルールの説明を表示する.
	@bash bin/make.usage $(MAKEFILE_LIST)

.PHONY: test
test: # 単体テストを実行する.
	@find ./test -type f -name 'test.*.sh' | xargs -r -n 1 bash

