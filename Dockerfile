FROM be-builder:0.0.1-ruby-2.3.1 as builder

WORKDIR /usr/local/src
COPY ./components ./components
RUN bundle install


FROM be-runtime:0.0.1-ruby-2.3.1 as runtime
RUN apk add libpq nodejs
CMD ['rails', 's']
