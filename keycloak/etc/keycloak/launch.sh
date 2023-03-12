#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
KEYCLOAK_HOME=/opt/keycloak

if [[ "$1" == "domain" ]]; then
    $KEYCLOAK_HOME/bin/domain.sh -c $2 -b $3
else
    $KEYCLOAK_HOME/bin/standalone.sh -c $2 -b $3
fi
