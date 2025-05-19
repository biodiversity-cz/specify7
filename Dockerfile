FROM specifyconsortium/specify7-service:production@sha256:04a6e7a3757df8449e6a3125df45d95d2423ea2881fb81d251b12dcbb10e1266
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/specify7
LABEL description="Individual build of Specify 7 docker image"

COPY --chown=specify:specify docker-entrypoint.sh /opt/specify7/docker-entrypoint.sh

USER root
RUN mkdir /sock && \
    chown -R specify:specify /sock

USER specify

#https://discourse.specifysoftware.org/t/specify-7-10-release-announcement/2196
ENV SPECIFY_CONFIG_DIR=/opt/specify7/config
CMD ["ve/bin/gunicorn", "-w", "3", "-b", "unix:/sock/docker.sock", "-t", "300", "specifyweb_wsgi"]