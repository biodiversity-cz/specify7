FROM specifyconsortium/specify7-service:production@sha256:3b23e9870a665b6a753e413176eaf2b5bbdcf797781e14b599eeb711d9eaafef
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