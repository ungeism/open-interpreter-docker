# Open Interpreter Docker セットアップガイド

## 1. 前提条件

- Docker がインストールされていることを確認してください。
- Git がインストールされていることを確認してください。

## 2. リポジトリのクローン

GitHub リポジトリをローカルにクローンします。

```bash
git clone https://github.com/ungeism/open-interpreter-docker.git
cd open-interpreter-docker
```

## 3. API キーの設定

.env.example を複製して、.env ファイルを作成。

```bash
cp .env.example .env
```

OpenAI API キーを設定します。

```.env
OPENAI_API_KEY=your_api_key
```

## 4. Docker イメージのビルド

以下のコマンドを実行して、Docker イメージをビルドします。

```bash
docker build -t open-interpreter:latest .
```

## 5. Docker コンテナの実行

以下のコマンドを使用して、Docker コンテナを実行します。

```bash
docker run -it --name open-interpreter-container --env-file .env open-interpreter:latest
```

## 6. Open Interpreter の使用

コンテナ内で、以下のコマンドを実行して Open Interpreter を起動します。

```bash
interpreter
```

これで、Open Interpreter のインタラクティブなインターフェースが表示され、自然言語での指示に従ってコードを書き、実行することができます。

## 7. 環境変数の変更時

コンテナ内で、以下のコマンドを実行して Open Interpreter を起動します。

### 1. 既存のコンテナを停止・削除:

新しいターミナルを開いて実行します。

```bash
docker stop open-interpreter-container
docker rm open-interpreter-container
```

### 2. 修正した .env ファイルを使用して新しいコンテナを実行:

```bash
docker run -it --name open-interpreter-container --env-file .env open-interpreter:latest
```

これで、Open Interpreter のインタラクティブなインターフェースが表示され、自然言語での指示に従ってコードを書き、実行することができます。

## 8. 既存のコンテナの再利用

もし、open-interpreter-container という名前のコンテナを既に作成していて、それを再利用したい場合は、以下の手順を実行してください。

### 1. コンテナの再起動:

以下のコマンドを使用して、既存のコンテナを再起動します。

```bash
docker start open-interpreter-container
```

### 2. コンテナ内のシェルにアクセス:

コンテナが起動した後、以下のコマンドでコンテナ内のシェルにアクセスできます。

```bash
docker exec -it open-interpreter-container /bin/bash
```

## 9. 終了方法

Open Interpreter のセッションを終了するには、exit または quit を入力します。その後、コンテナを終了するには、別のターミナルウィンドウを開き、以下のコマンドを実行します。

```bash
docker stop open-interpreter-container
```
