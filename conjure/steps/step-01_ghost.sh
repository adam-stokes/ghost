#!/bin/bash

. /usr/share/conjure-up/hooklib/common.sh

exposeResult "Visit your Ghost application at http://$(unitAddress haproxy 0)" 0 "true"
