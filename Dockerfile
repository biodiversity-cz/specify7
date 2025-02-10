FROM specifyconsortium/specify6-service:6.8.03@sha256:6bab39a4a6424fe32d1a9a7f7adf7dea19d0f27aa723bd4a90e6978e200df2e5 AS s6

FROM specifyconsortium/specify7-service:production@sha256:60914456fb5eaf270315f95f7953821ed48d8a8736050023fbedc47b0933e49d
LABEL org.opencontainers.image.source=https://github.com/biodiversity-cz/specify7
LABEL description="Individual build of Specify 7 docker image"

COPY --from=s6 --chown=specify:specify /opt/Specify /opt/Specify

COPY --chown=specify:specify 0002_geo.py /opt/specify7/specifyweb/specify/migrations/0002_geo.py

USER root
RUN   mkdir /sock && \
    chown -R specify:specify /sock

USER specify
CMD ["ve/bin/gunicorn", "-w", "3", "-b", "unix:/sock/docker.sock", "-t", "300", "specifyweb_wsgi"]