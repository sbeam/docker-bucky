#!/bin/bash

sed -e "s/{{STATSD_HOST}}/$STATSD_HOST/" -e "s/{{STATSD_PORT}}/$STATSD_PORT/" config/default.yml.tpl > config/default.yaml

./start.js
