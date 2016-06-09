#!/bin/bash

. /usr/share/conjure-up/hooklib/common.sh

services=("haproxy" \
          "mysql" \
          "ghost")

checkUnitsForErrors $services

if [ $(unitStatus ghost 0) != "active" ]; then
    exposeResult "Waiting on ghost" 0 "false"
fi

if [ $(unitStatus mysql 0) != "active" ]; then
    exposeResult "Waiting on mysql" 0 "false"
fi

if [ $(unitStatus haproxy 0) != "active" ]; then
    exposeResult "Waiting on haproxy" 0 "false"
fi


exposeResult "Applications ready" 0 "true"
