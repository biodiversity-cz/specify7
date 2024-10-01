# specify7
Specify7 image

* includes S6 files (from specifyconsortium/specify6-service:6.8.03) mounted in /volumes/Specify
* modified specifyweb/specify/migrations/0002_geo.py - run migrations, on error proceed 0002_geo.sql and rerun migrations... (needed only first time when S7 touches S6 database)  
* use unix socket instead of TCP (as deploying in Kubernetes)

Documentation for curators please see [curator documentation](docs/index.md)