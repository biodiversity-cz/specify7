FROM specifyconsortium/specify7-service:7.11@sha256:6b880cd01228100f3b8e8e0cbb005be32a4774aedfd68a6d0cf82097792eb0dd
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/specify7
LABEL description="Individual build of Specify 7 docker image"

COPY --chown=specify:specify docker-entrypoint.sh /opt/specify7/docker-entrypoint.sh

USER root
RUN mkdir /sock && \
    chown -R specify:specify /sock && \
    chmod -R 777 /volumes && \
    chmod -R 777 /sock

USER specify

#https://discourse.specifysoftware.org/t/specify-7-10-release-announcement/2196
ENV SPECIFY_CONFIG_DIR=/opt/specify7/config
CMD ["ve/bin/gunicorn", "-w", "3", "-b", "unix:/sock/docker.sock", "-t", "300", "specifyweb_wsgi"]
