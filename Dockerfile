# ベースイメージに Python と PHP をインストール
FROM ubuntu:20.04

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    python3-pip \
    php \
    apache2 \
    libapache2-mod-php \
    && apt-get clean

# Flask インストール
RUN pip3 install Flask

# PHP の設定
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# 作業ディレクトリを設定
WORKDIR /app

# Flask アプリのファイルをコピー
COPY app.py /app/

# PHP アプリのファイルをコピー
COPY index.php /var/www/html/

# Flask アプリを 10000 番ポートで、PHP を 80 番ポートで実行
CMD bash -c "flask run --host=0.0.0.0 --port=10000 & apachectl -D FOREGROUND"
