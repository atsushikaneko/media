FROM ruby:2.5.3
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y \
    build-essential \
 && rm -rf /var/lib/apt/lists/*
RUN mkdir /workdir
WORKDIR /workdir
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle install
RUN apt update
RUN apt install -y graphviz
ADD . /workdir
