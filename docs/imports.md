# Hromadné importy dat
Specify má velmi silný nástroj pro import dat = Workbench. V principu jde o mapování sloupců Excelu na sloupce databázových tabulek. Přes Workbench jde improtovat taxony, sbírkové položky, asi cokoliv. Níže pár příkladů jak na to:

## taxa #1, S7
Máme taxony v Excelu, soubor [taxa1](data/taxa1.xlsx) a chceme je přidat do stromu taxonů. 

S7: Workbench -> Import file -> šedý obdélník nahrát.. -> Import file -> "No upload plan is defined" -> Create -> Taxon
> hodně toho odhadne sám, jen Kingdom a Phylum/Division se musí ručně namapovat 
> 
> v prvním sloupci roletkových přepínačů mu tedy říkám "tento sloupec excelu považuj za *položku* určeného *ranku*"
>
> v druhém sloupci pak říkám: "jde konkrétně o toto pole v rámci popisu *položky*"

* My tedy v prvním sloupci vyberem stejnojmenné ranky a v druhém sloupci všude hodnotu "Name"
* Vpravo nahoře "Save", poté vpravo nahoře "Validate". Po chvilce (zpracovává asynchronní runner) přehledně ukáže co s těmi daty plánuje udělat když potvrdíme upload.
* Zeptá se zda chceme vytvářet Result Set => No.
* Hotovo
* brzy by Workbench byla zacpaná těmito import, tj:

S7: Workbench -> 🖉 -> Delete

Každý import přes Workbench má možnost Rollback. U **stromových číselníků nepoužívat**, protože se zasekne (chce odstranit první položku která ale obsahuje vyšší ranky, které ale vyžadují položky následující). Když dojde k zaseknutí apliakce (stop/cancel/stop/cancel..) tak přenačíst stránku F5, nicméně ten dataset už na Workbench zůstane viset natrvalo.

