# Správa stromových číselníků
Geografická jména, taxony a fyzické umístění exponátů jsou hierarchické číselníky, dále jen *stromy*.

### ranky
Každý strom má výčet *ranků*, povolených či povinných hierachických úrovní. Tyto *ranky* se nazývají *Tree Def Items* a nastavují se v S6 Wizard při zakládání kolekce. Wizard ale neobsahuje všechny - v S7 vidím u taxonů třeba i "forma/subforma" což Wizard neukazoval. 

Ranky jde přidávat, přejmenovávat a jinak upravovat
* S7: Trees -> 🖉 -> TTD | Tree Def Items
* S6: Trees -> Open Tree Definition -> poklikem na řádek upravuji daný rank, add/delete je skryté úplně vpravo dole

jde tedy nastavit zda se:
* má kurátorovi nabízet/mít možnost ji použít (tj. zda ten rank existuje)
* "is required" je interní požadavek Specify, nelze změnit, ukazuje se asi jen ve Wizard
* je pro kurátory resp. Collection object povinná
* vypisuje se do "plného jména" taxonu. Je tedy zřejmě na kurátorovi zda zvolí přístup psát do Species celé jméno (a Genus nevypisuje) nebo jen druhový přívlastek (a vypisuje Genus) 

### položky
Položkou je třeba konkrétní taxon, nebo místnost. 

### TODO
* neznáme chování když je rank definován + u nějakého taxonu vyplněn a přitom ho z Tree Def Items smažeme