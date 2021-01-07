# docker-laravel

## 開発環境
ローカルのDocker環境での構築方法です。

本リポジトリをclone後に以下のコマンドで構築してください。

```shell
# 初期化（初回のみ）
make init
# 立ち上げ
make up
# 終了
make down
```

以下のURLで確認できます。  
http://127.0.0.1

## テスト
以下でテストを実行できます。
```shell
# 全体の実行
make test
# 対象を指定して実行
make test TARGET=tests/Feature/
make test TARGET=tests/Feature/ExampleTest.php
# XDebugを使ったデバッグ実行（要PhpStormの設定）
make test DEBUG=debug
make test TARGET=tests/Feature/ DEBUG=debug
```

## QA
QAツールとして以下を用意しています。
```shell
# コーディング規約判定
make qa-cs
# コード整形
make qa-fix
# 静的解析
make qa-analyse
```
