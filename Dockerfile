# damon/rails
#
# This installs some common dependencies of Ruby gems, and Rails.

FROM damon/base

# Add the postgresql repository for the 9.3 client
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update -qq

# Install the rails dependencies
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -qq libcurl4-openssl-dev libevent-dev libglib2.0-dev \
    libjpeg-dev libjpeg62 libpng12-0 libpng12-dev libmagickcore-dev \
    libmagickwand-dev libpq-dev libssl-dev libssl0.9.8 libxml2-dev \
    libxslt-dev zlib1g-dev gawk libreadline6-dev libyaml-dev \
    postgresql-client-9.3

# Install bundler
RUN gem install --no-ri --no-rdoc bundler
