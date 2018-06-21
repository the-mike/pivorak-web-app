FROM ruby:2.3.1-alpine

WORKDIR /usr/local/src
COPY Gemfile* ./
COPY ./components ./components
RUN apk add --update build-base postgresql-dev git --virtual .app-builddeps && gem install bundler \
  && bundle install \
  && apk add tzdata libpq nodejs --virtual .app-rundeps && apk del .app-builddeps

COPY . ./
CMD ['rails', 's']
