# ruční vkládání dat
Základním místem pro ruční zadávání nových dat je *Data Entry*. Pro hromadné importy viz [samostatný návod](imports.md).

* S6 je nabídka objektů které jde vkládat pevná a omezená. 
* S7 -> Data Entry -> 🖉 umožní vybrat si zda chci používat objekty z S6 nebo užít -> *custom settings* -> Apply. V pravém poli si dohledám objekty které chci vkládat, vyberu, a prohazovací šipkou <> mezi oběma seznamy si přidám/uberu ty které chci. Vlevo od levého seznamu mám i vertikální prohazovačku pro úpravu pořadí v menu.
Tímto způsobem si tam jde dosta třeba právě i Material Sample.

# číslování záznamů

dle [docs](https://discourse.specifysoftware.org/t/editing-the-schema-configuration/235#format-a-field-11) cituji:
 > Accession and Catalog Number formats are configured during the institution setup ... Gift Number and Loan Number often have a unique format within collections. These can be formatted in the Schema Configuration tool, which will change the format for the entire discipline. In other words, if a Gift Number is formatted in the schema configuration all the collections within the discipline will be required to use the new format, which will display on the Gift form.

> Catalog and Accession Numbers may not be edited in the Schema Configuration tool. At this time they may not be edited once they have been created. Field Formats that are created in the Schema Configuration tool may NOT be edited once data resides in the database.

Při zakládání obou Collection jsem zvolil vzestupnou číselnou řadu bez prefixu. Nyní tedy nelze změnit, můžeme udělat při čistém znovuvytvoření databáze.