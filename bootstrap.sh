#!/usr/bin/env bash

apt-get update

# RVM and Ruby
if ! type "rvm" > /dev/null; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

ruby -v

# Apache setup
apt-get install -y apache2
cp /vagrant/server_setup/demo-app.conf /etc/apache2/sites-available/
a2dissite 000-default
a2ensite demo-app

# Passenger
if ! type "passenger" > /dev/null; then
  gem install passenger -v 5.0.2
  apt-get install -y libcurl4-openssl-dev
  apt-get install -y apache2-threaded-dev
  apt-get install -y libapr1-dev
  apt-get install -y libaprutil1-dev
  passenger-install-apache2-module
  cp /vagrant/server_setup/passenger.conf /etc/apache2/conf-available/
  a2enconf passenger
fi

service apache2 reload

# sqlite3
apt-get install -y sqlite3

# git
apt-get install -y git

# app setup
mkdir -p /var/www/capistrano_demo
mkdir -p /var/www/capistrano_demo/shared/config
cp /vagrant/server_setup/secrets.yml /var/www/capistrano_demo/shared/config/
cp /vagrant/server_setup/database.yml /var/www/capistrano_demo/shared/config/
mkdir -p /var/www/capistrano_demo/shared/db
touch /var/www/capistrano_demo/shared/db/production.sqlite3
chown -R vagrant:vagrant /var/www/capistrano_demo
