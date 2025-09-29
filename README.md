# specify7
Specify7 no root image - the base image is checked [once per week](.github/dependabot.yml#L6) for updates and :production [Specify 7](https://github.com/specify/specify7) service image is rebuild.

* includes S6 files (from [specifyconsortium/specify6-service:6.8.03](https://hub.docker.com/r/specifyconsortium/specify6-service))
* modified specifyweb/specify/migrations/0002_geo.py - run migrations, on error proceed 0002_geo.sql and rerun migrations... (needed only first time when S7 touches S6 database)  
* use unix socket instead of TCP


Documentation for curators please see [curator documentation](https://github.com/biodiversity-cz/specify7/wiki)

[//]: # (obligatory branding for EOSC.CZ)
<hr style="margin-top: 100px; margin-bottom: 20px">

<p style="text-align: left"> <img src="https://webcentrum.muni.cz/media/3831863/seda_eosc.png" alt="EOSC CZ Logo" height="90"> </p>
This project output was developed with financial contributions from the EOSC CZ initiative throught the project National Repository Platform for Research Data (CZ.02.01.01/00/23_014/0008787) funded by Programme Johannes Amos Comenius (P JAC) of the Ministry of Education, Youth and Sports of the Czech Republic (MEYS).

<p style="text-align: left"> <img src="https://webcentrum.muni.cz/media/3832168/seda_eu-msmt_eng.png" alt="EU and MŠMT Logos" height="90"> </p>
