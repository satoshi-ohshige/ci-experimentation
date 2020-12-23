.PHONY: help
help: ## ヘルプを表示します。
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build
build: ## docker-composeのサービスをキャッシュを使用せずにビルドします。
	docker-compose build --no-cache --force-rm

.PHONY: up
up: ## コンテナをバックグラウンドで立ち上げます。
	docker-compose up -d

.PHONY: down
down: ## コンテナを停止して削除します。
	docker-compose down

.PHONY: ps
ps: ## コンテナの一覧を表示します。
	docker-compose ps

.PHONY: logs
logs: ## コンテナのログを逐次表示します。
	docker-compose logs -f


.PHONY: composer-install
composer-install: ## `composer install` を実行します。
	docker-compose run --rm node composer install


.PHONY: npm-install
npm-install: ## `npm install` を実行します。
	docker-compose run --rm node npm install

.PHONY: npm-dev
npm-dev: ## `npm run dev` を実行します。
	docker-compose run --rm node npm run dev


.PHONY: init
init: ## プロジェクトの初期設定を行います。
	@make build
	@make composer-install
	@make npm-install
	@make npm-dev
