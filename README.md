# Rust SAM Lay

Rust での Lambda 関数を用いた SAM ベースのサーバーレスアプリケーションプロジェクトを構築するためのテンプレート。

## 準備

事前に下記ツールのインストールとセットアップを行っておく必要がある。

- [cargo-generate](https://github.com/cargo-generate/cargo-generate)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [SAM CLI](https://github.com/aws/aws-sam-cli)

## 使い方

### プロジェクトの作成

cargo-generate を使用してプロジェクトを作成する。

```sh
cargo generate --git
```

### 開発

基本的には SAM CLI のコマンドがそのまま使用できるようにしているため、 各ライフサイクルで SAM CLI コマンドを実行する形となっている。

#### Lambda 関数の追加

新しい Lambda 関数を作成する場合、下記命名規則があるため、それに従う必要がある。

| 項目     | [template.yaml](./template.yaml) のリソース名 | [src/bin](./src/bin) のファイル名 |
| -------- | --------------------------------------------- | --------------------------------- |
| 命名規則 | キャメルケース                                | スネークケース                    |
| 例       | HelloWorldRustFunction                        | hello_world_rust_function.rs      |

[template.yaml](./template.yaml) に Lambda 関数のリソース名をキャメルケースで命名する。そして [src/bin](./src/bin) に Lambda 関数用の Rust ファイルを、そのリソース名のスネークケースで命名する。


#### ビルド

SAM CLI の build コマンドを経由で、[lambda-rust](https://github.com/softprops/lambda-rust) の Docker コンテナ上でビルドを行う。

```sh
sam build
```

#### ローカル実行

SAM CLI の local コマンドを使用して、ローカル環境で Lambda 関数を呼び出したり、API Gateway 環境を起動したりも通常通りできる。

```sh
sam local start-api
```

```sh
sam local invoke HelloWorldRustFunction --event events/apigateway/aws-proxy.json
```

#### デプロイ

```sh
sam deploy --guided # 初回デプロイ時(２回目以降は --guided オプションは不要)
```
