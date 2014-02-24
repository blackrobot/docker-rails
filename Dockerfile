# damon/rails
#
# This installs some common dependencies of Ruby gems, and Rails.

FROM damon/base

# Install the rails dependencies
RUN apt-get install -qqy libcurl4-openssl-dev libevent-dev libglib2.0-dev \
    libjpeg-dev libjpeg62 libpng12-0 libpng12-dev libmagickcore-dev \
    libmagickwand-dev libpq-dev libssl-dev libssl0.9.8 libxml2-dev \
    libxslt-dev zlib1g-dev gawk libreadline6-dev libyaml-dev

# Install bundler
RUN gem install --no-ri --no-rdoc bundler
