#!/bin/bash

( lsof -i -P | grep :80 > /dev/null ) || exit 1

[ -f /home/skauron/my_skript.sh ] || exit 1