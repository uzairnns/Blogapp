FROM ruby:2.7.5
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN apt-get update && \
    apt-get install -y nodejs
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
