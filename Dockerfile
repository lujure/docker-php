FROM ubuntu:14.04

MAINTAINER Eric Bittlman <ebittleman@heyo.com>

# install dependencies non-interactively
RUN \
  DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install git dos2unix imagemagick libmagickwand-dev build-essential php5-cgi php5 php5-cli php5-dev php5-fpm php5-curl php5-gd php5-mcrypt php5-mysql php-pear php-soap php-apc supervisor wget -y

# give us a spot for the wand install
RUN mkdir -p /tmp/php-wand

# send the wand install script to the container
ADD scripts/magickwand-php-install.sh /tmp/php-wand/magickwand-php-install.sh

# prep the install script
RUN chmod +x /tmp/php-wand/magickwand-php-install.sh

# install magickwand for php
RUN \
  TMP_CURR_DIR=`pwd` && \
  cd /tmp/php-wand && \
  ./magickwand-php-install.sh && \
  cd $TMP_CURR_DIR

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
