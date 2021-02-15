# Copyright 2018 Iguazio
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

.PHONY: help
help: ## Display available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all:
	$(error please pick a target)

.PHONY: lint
lint: lint-markdown lint-katacoda  ## lint all
	@echo "Done"

.PHONY: lint-katacoda
lint-katacoda: ## lint katacoda code
	@katacoda validate:all --repo $(shell pwd)

.PHONY: lint-markdown
lint-markdown: ## lint markdown files
	@echo "Linting markdown files"
	@markdownlint '**/*.md' --ignore node_modules
	@echo "Markdown files are valid"

.PHONY: install-lint-tools
install-lint-tools: ## Install lint tools
	@npm i katacoda-cli markdownlint-cli --global
