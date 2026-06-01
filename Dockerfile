FROM ruby:2.6.10

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

RUN gem update --system 3.3.22 && \
    gem install bundler:1.17.3 && \
    bundle config set --global frozen false

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

ARG GIT_SHA
ENV GIT_SHA=$GIT_SHA

EXPOSE 8080

CMD bash -c "bin/rails db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT:-8080}"