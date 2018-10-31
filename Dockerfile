FROM ruby:2.3.1-alpine as builder

WORKDIR /usr/local/src
RUN apk add --update build-base postgresql-dev git --virtual .app-builddeps && gem install bundler
COPY Gemfile* ./
COPY ./components ./components
RUN bundle install

FROM ruby:2.3.1-alpine as runtime

WORKDIR /usr/local/src
RUN apk add --update tzdata libpq nodejs postgresql-client --virtual .app-rundeps
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . ./
RUN bundle install --local
CMD ['rails', 's']
