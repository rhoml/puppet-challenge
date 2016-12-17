#!/bin/sh
set -e

echo ""
echo "  Bootstrapping Puppet-challenge"
echo ""

#
# Check for Bundler
#
if test ! $(which bundle)
then
  echo "  x You need to install Bundler:"
  echo "    gem install bundler"
  exit
else
  echo "  + Bundler found."
fi

#
# Install gems
#
echo "  + Bootstrapping your Rubies."
bundle install --binstubs --path vendor/gems --quiet

#
# Install modules
#
echo "  + Bootstrapping your modules."
bundle exec librarian-puppet install --quiet

#
# Startup instructions
#
echo ""

echo "  We have installed all dependencies for puppet-challenge..."
echo "  Let's bring our vagrant box up"
echo ""
echo " vagrant UUUUUP!"
vagrant up
