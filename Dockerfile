FROM specifyconsortium/specify7-service:production@sha256:e980beab550931889d93f45745952b9c0e3290a1f268600de77ee1ce71e0afaa
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