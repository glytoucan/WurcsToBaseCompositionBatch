#!/bin/sh
. ./build.env
echo version=$VERSION
echo docker-compose -f docker-compose.release.yml up --remove-orphans
docker-compose -f docker-compose.release.yml up --remove-orphans
docker commit glytoucanWurcsToBsaeCompositionv1.2.1-SNAPSHOT glycoinfo.org:5000/glytoucan_wurcstobasecomposition:v1.2.1-SNAPSHOT
docker push glycoinfo.org:5000/glytoucan_wurcstobasecomposition:v1.2.1-SNAPSHOT
