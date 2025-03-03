FROM specifyconsortium/specify6-service:6.8.03@sha256:6bab39a4a6424fe32d1a9a7f7adf7dea19d0f27aa723bd4a90e6978e200df2e5 AS s6

FROM specifyconsortium/specify7-service:production@sha256:046c7bb9de4fb27f3a975e4d8b16a26598221a07a4a7c2785b4ef2fb7994bac3
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/specify7
LABEL description="Individual build of Specify 7 docker image"

COPY --from=s6 --chown=specify:specify /opt/Specify /opt/Specify

COPY --chown=specify:specify 0002_geo.py /opt/specify7/specifyweb/specify/migrations/0002_geo.py

USER root
RUN   mkdir /sock && \
    chown -R specify:specify /sock

USER specify
CMD ["ve/bin/gunicorn", "-w", "3", "-b", "unix:/sock/docker.sock", "-t", "300", "specifyweb_wsgi"]