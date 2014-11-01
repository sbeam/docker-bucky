#!/bin/bash

sed -e "s/{{INFLUXDB_DATABASE}}/$INFLUXDB_DATABASE/"  -e "s/{{INFLUXDB_USERNAME}}/$INFLUXDB_USERNAME/" -e "s/{{INFLUXDB_PASSWORD}}/$INFLUXDB_PASSWORD/" config/default.yaml.template > config/default.yaml

./start.js

