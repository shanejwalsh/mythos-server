FROM ruby:4.0.5

RUN apt-get update -qq && apt-get install -y postgresql-client

WORKDIR /app

ENV BUNDLE_PATH="/usr/local/bundle"
ENV BUNDLE_BIN="/usr/local/bundle/bin"
ENV PATH="${BUNDLE_BIN}:${PATH}"

# Match the bundler version pinned in Gemfile.lock (BUNDLED WITH)
RUN gem install bundler -v 4.0.14 && \
    bundler --version

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

ARG GIT_SHA
ENV GIT_SHA=$GIT_SHA

EXPOSE 8080

CMD bash -c "rm -f tmp/pids/server.pid && bin/rails db:migrate && bin/rails db:seed && bin/rails server -b 0.0.0.0 -p ${PORT:-8080}"
