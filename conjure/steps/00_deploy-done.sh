#!/bin/bash

. /usr/share/conjure-up/hooklib/common.sh

services=("haproxy" \
          "mysql" \
          "ghost")

checkUnitsForErrors $services

if [ $(unitStatus ghost 0) != "active" ]; then
    exposeResult "Ghost is not ready yet" 0 "false"
fi

if [ $(unitStatus mysql 0) != "active" ]; then
    exposeResult "MySQL is not ready yet" 0 "false"
fi

if [ $(unitJujuStatus haproxy 0) != "idle" ]; then
    exposeResult "HAProxy is not ready yet" 0 "false"
fi


exposeResult "Applications ready" 0 "true"
