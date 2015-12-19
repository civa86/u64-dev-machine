#!/bin/bash

VAGRANT_DIRECTORY="/vagrant"
PUPPET_MODULES="/etc/puppet/modules"

echo "SMART HOME VM PROVISIONING"

if [ -d "$VAGRANT_DIRECTORY" ]; then
  echo "Vagrant Shared Folder OK"
fi

# PUPPET APACHE
if [ ! -d "$PUPPET_MODULES/apache" ]; then
  puppet module install puppetlabs/apache
fi

# PUPPET PHP
if [ ! -d "$PUPPET_MODULES/php" ]; then
  puppet module install example42/php
fi

## PUPPET NODEJS
if [ ! -d "$PUPPET_MODULES/nodejs" ]; then
  puppet module install puppetlabs/nodejs
fi

## PUPPET MYSQL
if [ ! -d "$PUPPET_MODULES/mysql" ]; then
  puppet module install puppetlabs/mysql
fi

## PUPPET TIMEZONE
if [ ! -d "$PUPPET_MODULES/timezone" ]; then
  puppet module install saz/timezone
fi


