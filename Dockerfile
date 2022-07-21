FROM ruby:3.0.1

WORKDIR /GEMS

COPY Gemfile /GEMS

ENV BUNDLER_VERSION 2.2.15
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install

CMD irb
