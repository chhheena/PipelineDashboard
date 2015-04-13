#!/bin/sh
set -e

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy.pem
ssh-add .travis/deploy.pem

if [ "$1" = "release-0.2-pre-alpha" ]
then
    echo "add remote"
    git remote add ci dokku@alpha.dashboardhub.io:alpha
    echo "pushing"
    git push alpha $GIT_TAG:master -f
    echo "run migrations"
    ssh dokku@alpha.dashboardhub.io run alpha php app/console doctrine:schema:update --force
fi