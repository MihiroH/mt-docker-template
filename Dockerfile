# Perl 5.32を使用
FROM perl:5.32

# パッケージインストール
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-perl2 \
    mariadb-client \
    cpanminus \
    && rm -rf /var/lib/apt/lists/*

# Perlモジュールインストール
RUN cpanm \
    CGI \
    CGI::Cookie \
    DBD::mysql \
    DBI \
    File::Spec \
    HTML::Entities \
    Image::Size \
    LWP::UserAgent \
    Scalar::Util \
    parent

# Apacheモジュール有効化
RUN a2enmod perl cgi rewrite

# Apacheの設定をコピー
COPY ./settings/apache2 /etc/apache2

# MTの設定をコピー
COPY ./mt-data/cgi-bin /var/www/cgi-bin

# シェルスクリプトのコピーと実行許可の付与
COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh

# Apache実行前にsetup.shを実行
CMD /setup.sh && /usr/sbin/apache2ctl -D FOREGROUND
