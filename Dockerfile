FROM ruby:2.6.10

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

ENV BUNDLE_PATH="/usr/local/bundle"
ENV BUNDLE_BIN="/usr/local/bundle/bin"
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN gem update --system 3.3.22 && \
    gem install bundler:1.17.3 && \
    bundler --version

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

ARG GIT_SHA
ENV GIT_SHA=$GIT_SHA

EXPOSE 8080

CMD bash -c "rm -f tmp/pids/server.pid && bin/rails db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT:-8080}"