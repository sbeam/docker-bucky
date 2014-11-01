FROM dockerfile/nodejs

ENV BUCKY_VERSION 0.4.1

RUN wget https://github.com/HubSpot/BuckyServer/archive/v$BUCKY_VERSION.tar.gz -O /opt/BuckyServer.tar.gz && \
    mkdir -p /opt/BuckyServer && \
    tar --strip-components=1 -xzf /opt/BuckyServer.tar.gz -C /opt/BuckyServer

RUN cd /opt/BuckyServer && npm install

ADD default.yaml.template /opt/BuckyServer/config/default.yaml.template

ADD run.sh /opt/BuckyServer/run.sh
RUN chmod +x /opt/BuckyServer/run.sh

WORKDIR /opt/BuckyServer

CMD ["./run.sh"]
