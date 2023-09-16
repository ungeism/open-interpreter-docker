# ベースイメージとしてUbuntu 22.04を使用
FROM ubuntu:22.04

# パッケージリストの更新と必要なツールのインストール
RUN apt-get update -q && \
    apt-get install -yq git python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Pythonパッケージのインストール
RUN pip install open-interpreter numpy matplotlib pandas

# 作業ディレクトリの設定
WORKDIR /app