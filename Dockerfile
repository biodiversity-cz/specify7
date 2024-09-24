FROM specifyconsortium/specify7-service:production@sha256:0b89c3eca81d43c706abb7a48b61ecd4f39aee34d9ed6c8b4f10a9eabe76831f

COPY  --chown=specify:specify s6 /opt/Specify
COPY  --chown=specify:specify 0002_geo.py /opt/specify7/specifyweb/specify/migrations/0002_geo.py
