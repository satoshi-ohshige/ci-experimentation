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

### PhpStormの設定
PhpStorm 2020.3.1 の設定方法です。2020.3.1以降では異なる可能性があります。  
※2020.3.1以前だとXDebug3との相性が悪くうまく設定できないことがあります。

#### CLI Interpreter
PhpStorm > Preferences > Languages & Frameworks > PHP  
CLI Interpreterの項目を `<no interpreter>` から `php-cli` に変更

#### Composer
PhpStorm > Preferences > Languages & Frameworks > PHP > Composer  
Executionの項目を `'composer' executable` から `Remote Interpreter` に変更
その後、CLI Interpreterの項目を `<no interpreter>` から `php-cli` に変更

#### QA
PhpStorm > Preferences > Languages & Frameworks > PHP > Quality Tools  
PHP_CodesnifferのConfigurationの項目を `Local` から `Interpreter: php-cli` に変更  
PHPStanのConfigurationの項目を `Local` から `Interpreter: php-cli` に変更

#### Remote Debug
PhpStorm > Preferences > Languages & Frameworks > PHP > Servers  
`+` を押して新しい設定を作成  
Nameの項目を `Unnamed` から `docker-debug` (何でもOK) に変更    
Hostの項目に `docker-debug-host` (何でもOK) を入力  
Postの項目を `80` から `9003` に変更  
Use path mappingsの項目をチェック  
File/Directoryの自分自身のプロジェクトルートパスに対応するAbsolute on the serverの項目に `/work` を入力

Run > Edit Configurations...
`+` を押してPHP Remote Debugを選択して新しい設定を作成  
Nameの項目を `Unnamed` から `docker-debug` (何でもOK) に変更
ConfigurationのFilter debug connection by IDE keyをチェック  
ConfigurationのServerの項目を `;` から `docker-debug` (Serversで作ったもの) に変更  
ConfigurationのIDEKEYの項目に `PHPSTORM` を入力


## テスト
以下でテストを実行できます。
```shell
# 全体の実行
make test
# 対象を指定して実行
make test TARGET=tests/Feature/
make test TARGET=tests/Feature/ExampleTest.php
# XDebugを使ったデバッグ実行（詳細はデバッグの項目参照）
make test DEBUG=debug
make test TARGET=tests/Feature/ DEBUG=debug
```

テストファイルのクラスやメソッドの横にあるRunやDebug(詳細はデバッグの項目参照)などのボタンからでもGUI的にテスト実行できます。


## デバッグ
### ブラウザからのリモートデバッグ
1. 右上のデバッグ項目から `docker-debug` (PHP Remote Debugで作ったもの) を選択  
1. 適当にブレークポイントを張り、Debugボタンを押す  
1. ブラウザから適当なURLを呼び出すと、ブレークポイントで止まりステップ実行できる

### CLIからのPHPUnitを実行する場合のリモートデバッグ
1. 右上のデバッグ項目から `docker-debug` (PHP Remote Debugで作ったもの) を選択
1. 適当にブレークポイントを張り、Debugボタンを押す
1. `make test DEBUG=debug` などと実行すると、ブレークポイントで止まりステップ実行できる

### テストファイルからPHPUnitを実行する場合のリモートデバッグ
1. 適当にブレークポイントを張る
1. 対象のテストファイルのクラスやメソッドの横のDebugボタンを押すと、ブレークポイントで止まりステップ実行できる


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
