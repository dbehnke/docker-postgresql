FROM dbehnke/ubuntu1404:latest
MAINTAINER dbehnke74@gmail.com

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && \
  apt-get -qq -y install pwgen postgresql-9.3 postgresql-client-9.3 && \
  rm -rf /var/lib/postgresql &&  \
  apt-get clean

ADD start /start
RUN chmod 755 /start

EXPOSE 5432
VOLUME ["/var/lib/postgresql"]
CMD ["/start"]
