# damon/rails
#
# This installs some common dependencies of Ruby gems, and Rails.

FROM damon/ruby

# Add nodejs repository
RUN add-apt-repository -y ppa:chris-lea/node.js

# Add the postgresql repository for the latest client
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Update the sources with our new repositories
RUN apt-get update -qq

# Install the rails dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
    gawk \
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
    libssl1.0.0 \
    libxml2-dev \
    libxslt-dev

# Install nodejs
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq nodejs

# Install postgresql client 9.3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yqq postgresql-client-9.3
