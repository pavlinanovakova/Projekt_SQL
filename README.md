# Projekt_SQL_Engeto
Analýza dostupnosti potravin na základě průměrných příjmů

# Zadání projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

# Výstup projektu
Pomozte kolegům s daným úkolem. Výstupem by měly být dvě tabulky v databázi, ze kterých se požadovaná data dají získat. Vytvořte 2 tabulky (pro data mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky) a (pro dodatečná data o dalších evropských státech).
Dále připravte sadu SQL, které z vámi připravených tabulek získají datový podklad k odpovězení na vytyčené výzkumné otázky. Pozor, otázky/hypotézy mohou vaše výstupy podporovat i vyvracet! Záleží na tom, co říkají data.

# Výzkumné otázky a odpovědi
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
- Mzdy rostou každý rok jen ve čtyřech odvětvích (C, H, Q, S), nejhůře dopadl průmysl B

2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
- V roce 2006 se za průměrnou roční mzdu dalo koupit 1287 kilo chleba a 1437 litrů mléka
- V roce 2008 se za průměrnou roční mzdu dalo koupit 1342 kilo chleba a 1642 litrů mléka

3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
- Dvě potraviny byly v roce 2018 levnější než v roce 2006: Cukr krystalový -27,52% a Rajská jablka červená kulatá -23,07%, nejpomaleji zdražují Banány žluté o 7,4%, meziroční růst byl 0,62%.

4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
- V žádném roce nebyl nárůst cen větší než 10% v porovnání s růstem mezd. Nejhorší rok byl 2013 - mzdy klesly o -1,6%, ceny vzrostly o 5,1% (rozdíl byl 6,7%).

5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
- Mzdy obvykle rostou s HDP, ale někdy se zpožděním, ceny potravin se neřídí pouze HDP, ale také dalšími faktory
- Výsledek korelace ve mzdách a cenách potravin ve stejném roce:
    - HDP a ceny potravin: 0,45 – středně silná pozitivní korelace
    - HDP a mzdy: 0,34 – slabá až středně silná pozitivní korelace
- Výsledek korelace ve mzdách a cenách potravin v následujícím roce:
    - HDP a ceny potravin: -0,45 – středně silná negativní korelace
    - HDP a mzdy: -0,72 – silná negativní korelace
- Největší růst HDP byl v roce 2007 o 5,57%, ve stejném roce mzdy vzrostly o 6,84% a ceny potravin vzrostly o 6,76%

# Závěr
- Docela mě potrápilo exportovat SQL dotazy z DBeaveru do složky v počítači a pak je dostat na github, musela jsem smazat i první vytvořený repozitář na githubu, protože jsem se zamotala do několika větví.

Autor: Pavlína Nováková
