
.DEFAULT_GOAL := help

.PHONY: help
help: # 各ルールの説明を表示する.
	@bash scripts/make.usage $(MAKEFILE_LIST)

.PHONY: test
test: # 単体テストを実行する.
	@bash test/test.*.sh

