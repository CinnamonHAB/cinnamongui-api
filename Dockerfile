FROM ruby:2.2.5-slim

MAINTAINER Mak Krnic <mak.krnic@fer.hr>

RUN apt-get update && apt-get install -y wget libsqlite3-dev nodejs

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' >> /etc/apt/sources.list.d/postgresql.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client

ENV APP_HOME /cinnamonapi
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_PATH /box

ADD Gemfile $APP_HOME
ADD Gemfile.lock $APP_HOME

EXPOSE 3000
