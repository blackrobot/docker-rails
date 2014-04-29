# namely/rails
#
# This installs some common dependencies of Ruby gems, and Rails.

FROM damon/base

# Add the postgresql repository for the latest client
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update -qq

# Install the rails dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq --force-yes \
    autoconf \
    imagemagick \
    libcurl4-openssl-dev \
    libevent-dev \
    libglib2.0-dev \
    libjpeg-dev \
    libjpeg62 \
    libpng12-0 \
    libpng12-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libpq-dev \
    libssl-dev \
    libssl1.0.0 \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    zlib1g-dev \
    gawk \
    libreadline6-dev \
    libyaml-dev

# Install postgresql client 9.3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq postgresql-client-9.3

# Install ruby 2.1
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq ruby2.1 ruby2.1-dev

# Install bundler
RUN gem install --no-ri --no-rdoc bundler
