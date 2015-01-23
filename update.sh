#!/bin/sh
./composer.phar update --ignore-platform-reqs
git add composer.lock composer.json
git commit -m "Updated lock"
