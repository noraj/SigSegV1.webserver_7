# Author: noraj
# Author website: https://rawsec.ml

FROM debian:stretch-20180831

RUN apt update && apt install -y ruby2.3 sqlite3
# install dependencies
RUN gem install sinatra thin sqlite3

# drop privileges
RUN groupadd -g 1337 appuser && \
    useradd -r -u 1337 -g appuser appuser
USER appuser

COPY ./webserver.rb /usr/src/app/webserver.rb
COPY ./database.db /usr/src/app/database.db
COPY ./public /usr/src/app/public
COPY ./views /usr/src/app/views

WORKDIR /usr/src/app

CMD ruby ./webserver.rb
