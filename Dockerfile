FROM gregory90/nodejs:latest

RUN wget https://github.com/HubSpot/BuckyServer/archive/v0.3.0.tar.gz -O /opt/BuckyServer.tar.gz && \
    tar xvf /opt/BuckyServer.tar.gz -C /opt

RUN cd /opt/BuckyServer-0.3.0 && npm install

ADD default.yml /opt/BuckyServer-0.3.0/config/default.yml.tpl
WORKDIR /opt/BuckyServer-0.3.0

ADD run.sh /opt/BuckyServer-0.3.0/run.sh
RUN chmod +x /opt/BuckyServer-0.3.0/run.sh

CMD ["./run.sh"]
