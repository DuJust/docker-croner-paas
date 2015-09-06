FROM ruby:2.2.0
MAINTAINER Du Just <du.just.it@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3 libsqlite3-dev

RUN apt-get update && apt-get install -y \
    cron \
    curl

RUN curl -o /usr/local/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.6.0 && \
    chmod +x /usr/local/bin/docker

WORKDIR /web-app

ADD Gemfile /web-app/Gemfile
ADD Gemfile.lock /web-app/Gemfile.lock
RUN gem update bundler
RUN bundle install --jobs 8

ADD . /web-app

EXPOSE 3000

CMD ["rails", "server", "--binding", "0.0.0.0"]
