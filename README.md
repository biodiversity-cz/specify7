# specify7
Specify7 no root image - the base image is checked [once per week](.github/dependabot.yml#L6) for updates and :production [Specify 7](https://github.com/specify/specify7) service image is rebuild.

* includes S6 files (from [specifyconsortium/specify6-service:6.8.03](https://hub.docker.com/r/specifyconsortium/specify6-service))
* modified specifyweb/specify/migrations/0002_geo.py - run migrations, on error proceed 0002_geo.sql and rerun migrations... (needed only first time when S7 touches S6 database)  
* use unix socket instead of TCP


Documentation for curators please see [curator documentation](https://github.com/biodiversity-cz/specify7/wiki)