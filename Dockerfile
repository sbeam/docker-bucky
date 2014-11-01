FROM nodejs:latest

ENV BUCKY_VERSION 0.4.1

RUN wget https://github.com/HubSpot/BuckyServer/archive/v$BUCKY_VERSION.tar.gz -O /opt/BuckyServer.tar.gz && \
    mkdir -p /opt/BuckyServer && \
    tar xvf --strip-components=1 /opt/BuckyServer.tar.gz -C /opt/BuckyServer

RUN cd /opt/BuckyServer && npm install

ADD default.yaml /opt/BuckyServer/config/default.yaml
RUN sed -i '' '/{{[A-Z]+}}/ { \
  s|{{INFLUXDB_DATABASE}}|$INFLUXDB_DATABASE| \
  s|{{INFLUXDB_USERNAME}}|$INFLUXDB_USERNAME| \
  s|{{INFLUXDB_PASSWORD}}|$INFLUXDB_PASSWORD| \
}' /opt/BuckyServer/config/default.yaml

WORKDIR /opt/BuckyServer

CMD ["./start.js"]
