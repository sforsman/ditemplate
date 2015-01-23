#!/bin/sh
./composer.phar update --ignore-platform-reqs
git add composer.lock
git commit -m "Updated lock"
