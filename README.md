# Docker for BuckyServer + Influx
A docker container for BuckyServer with config hooked to a local InfluxDB container at 'influxdb'

### how to run

specify credentials via ENV when running:

    $ docker run -e INFLUXDB_DATABASE=mydb -e INFLUXDB_USERNAME=admin -e INFLUXDB_PASSWORD=passwird --name bucky --link influxdb:influxdb sbeam/bucky
