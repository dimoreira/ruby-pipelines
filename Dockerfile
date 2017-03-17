FROM ruby:2.3

MAINTAINER Diego Moreira <diegoalvesmoreira@gmail.com>
ENV MYSQL_USER=mysql
ENV MYSQL_DATA_DIR=/var/lib/mysql
ENV MYSQL_RUN_DIR=/run/mysqld
ENV MYSQL_LOG_DIR=/var/log/mysql

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server default-jre nodejs libssl1.0.0 openssl

RUN rm -rf /var/lib.apt/lists/*

CMD ["/usr/bin/mysqld_safe"]
