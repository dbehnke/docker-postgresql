FROM jgeiger/ubuntu:latest
MAINTAINER jgeiger@gmail.com

RUN apt-get update && \
  apt-get -qq -y install pwgen postgresql-9.3 postgresql-client-9.3 && \
  rm -rf /var/lib/postgresql &&  \
  apt-get clean

ADD start /start
RUN chmod 755 /start

EXPOSE 5432
VOLUME ["/var/lib/postgresql"]
CMD ["/start"]
