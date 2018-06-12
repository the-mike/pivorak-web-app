FROM ruby:2.3.1-alpine

RUN apk add --update build-base postgresql-dev tzdata git && gem install bundler
WORKDIR /usr/local/src
COPY Gemfile* ./
COPY ./components ./components
RUN bundle install

COPY . ./
CMD ['rails', 's']
