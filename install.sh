#!/bin/bash
if [ ! -f composer.phar ]; then
  curl -sS https://getcomposer.org/installer | php
fi
./composer.phar install --ignore-platform-reqs
