# ベースイメージの選択
FROM python:3.11-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なファイルをコピー
COPY requirements.txt requirements.txt
COPY app.py app.py

# パッケージのインストール
RUN pip install --no-cache-dir -r requirements.txt

# ポートを設定
EXPOSE 10000

# アプリの起動コマンド
CMD ["python", "app.py"]
