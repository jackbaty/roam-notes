SERVER_HOST=server01.baty.net
SERVER_DIR=/home/jbaty/apps/notes.baty.net/
PUBLIC_DIR=/Users/jbaty/sites/roam/public_html
TARGET=server01.baty.net

.POSIX:
.PHONY: help build checkpoint deploy


.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' 'Makefile' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@egrep -h 'h' 'Makefile' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


checkpoint:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

push:
	git push

deploy: checkpoint push
	@echo "\033[0;32mDeploying updates to $(TARGET)...\033[0m"
	rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR) $(SERVER_HOST):$(SERVER_DIR)


