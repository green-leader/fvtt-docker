FROM node:20-alpine

RUN deluser node && \
    mkdir /opt/foundryvtt && \
    mkdir -p /data/foundryvtt && \
    mkdir -p /opt/foundryvtt/resources/app && \
    adduser --disabled-password fvtt && \
    chown -R fvtt:fvtt /opt/foundryvtt && \
    chown -R fvtt:fvtt /data/foundryvtt && \
    chmod -R g+s /opt/foundryvtt && \
    chmod -R g+s /data/foundryvtt && \
USER fvtt

COPY --chown=fvtt run-server.sh /opt/foundryvtt
RUN chmod +x /opt/foundryvtt/run-server.sh
VOLUME /data/foundryvtt
VOLUME /host
VOLUME /opt/foundryvtt/resources/app
EXPOSE 30000

ENTRYPOINT /opt/foundryvtt/run-server.sh
