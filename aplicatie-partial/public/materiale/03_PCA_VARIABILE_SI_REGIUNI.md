# 3. Dim, cos² și ctr — trei întrebări diferite

## Mai întâi: te uiți la indicatori sau la regiuni?

- **Variables:** rândurile sunt indicatori: X1, X2, ocupare, PIB etc.
- **Individuals:** rândurile sunt regiuni: RO11, BE10 etc.

Aceeași etichetă **Dim.1** are sens diferit: la Variables este corelație cu PC1, în ACP standardizată; la Individuals este scorul regiunii pe PC1.

## 1. Variables — citește un singur rând

**Ce vezi, rotunjit:**

```text
Variables
       Dim.1   ctr    cos2
X1     0.719   7.69   0.516
```

Citești fiecare număr separat:

| Număr | Ce îți spune | Cum îl explici |
|---|---|---|
| Dim.1 = 0,719 | Legătura X1–PC1 | X1 este legat pozitiv de PC1 |
| cos² = 0,516 | Cât din X1 apare pe această axă | PC1 arată 51,6% din variația lui X1 |
| ctr = 7,69 | Cât ajută X1 la construirea axei | X1 contribuie cu 7,69% la PC1 |

**La test poți spune:** „X1 se corelează pozitiv cu PC1, cu 0,719. PC1 reprezintă 51,6% din variația X1, iar X1 contribuie cu 7,69% la construirea axei.”

**Reține:** cos² vorbește despre **cât vezi din X1**. Contribuția vorbește despre **cât aduce X1 la axă**. Sunt două întrebări diferite.

Nu transforma propoziția în „X1 explică 51,6% din PC1”: ai inversa sensul cos².

## 2. Cos² într-un plan — aduni ce vezi pe cele două axe

**Exemplu pentru densitate, X12:**

```text
cos2 PC1 = 0.034    cos2 PC2 = 0.266
cos2 plan 1-2 = 0.300
cos2 primele 4 = 0.816
```

**Cum înțelegi:** prima axă arată puțin din X12; a doua arată ceva mai mult. Împreună arată aproximativ 30%. Cu patru axe ajungi la 81,6%.

**La test poți spune:** „Densitatea este descrisă incomplet în primul plan, care surprinde circa 30% din variația sa. Primele patru axe o descriu mai bine, în proporție de 81,6%.”

**Reține:** nu vezi bine variabila în acest plan; asta nu o face inutilă în întreaga analiză.

## 3. Contribuție mare — cine contează mai mult la axă?

**Ce vezi pentru PC2:**

```text
Somaj general 27.91%    Somaj tineri 17.28%    Densitate 15.38%
```

**Cum înțelegi:** acești indicatori au aporturi mari la construirea axei. Dintre cei trei, șomajul general contează cel mai mult.

**La test poți spune:** „Șomajul general are cea mai mare contribuție dintre indicatorii prezentați la construirea PC2.”

La 12 indicatori, dacă ar contribui egal, fiecare ar avea 8,33%. Peste această valoare înseamnă aport peste distribuția egală, nu semnificație statistică. Contribuția nu spune dacă legătura este cu plus sau minus; pentru aceasta citești Dim.

## 4. Individuals — citește o regiune

**Ce vezi pentru BE10:**

```text
Dist 9.006    Dim.2 6.169    ctr PC2 19.00%    cos2 PC2 0.469
```

| Număr | Traducere simplă |
|---|---|
| Dist 9,006 | Cât de departe este regiunea de centrul datelor, privind toți indicatorii |
| Dim.2 6,169 | Unde este regiunea pe PC2: mult în sensul pozitiv |
| ctr 19% | Cât contribuie regiunea la construirea PC2 |
| cos² 0,469 | Cât de bine este descris profilul său pe PC2 |

**La test poți spune:** „BE10 are scor pozitiv ridicat pe PC2 și contribuie cu aproximativ 19% la această axă. PC2 surprinde circa 46,9% din distanța sa pătratică totală față de centru.”

Ultima parte este formularea exactă pentru cos² la regiuni. Pentru a o înțelege, gândește-te: **cât din profilul diferit al regiunii se vede pe această axă?**

**Reține:** regiune bine reprezentată nu înseamnă automat regiune bogată. Scorul 6,169 este permis; scorurile nu au limita ±1 a corelațiilor.

## 5. Aceeași regiune, cu două sau patru axe

**Ce vezi pentru BE10:**

```text
cos2 plan PC1-PC2 = 0.479
cos2 primele 4 = 0.909
```

**Cum înțelegi:** graficul cu primele două axe arată doar o parte din profil. Cu patru axe, profilul este descris mult mai complet.

**La test poți spune:** „Primul plan surprinde 47,9% din distanța pătratică totală a regiunii față de centru, iar primele patru axe surprind 90,9%.”

O regiune poate ieși în evidență pe PC2, dar să aibă detalii importante și pe alte axe.

## 6. Dist², masa și inerția

**Ce vezi pentru BE10:**

```text
distanta 9.006    distanta2 81.110    masa 0.008621    inertie 0.6992
```

**Cum înțelegi:**

- **Dist²:** distanța înmulțită cu ea însăși, aproximativ 81,11.
- **Masa:** cât contează regiunea în calcul. Aici toate regiunile contează egal: fiecare are 1/116.
- **Inerția:** cât aduce regiunea la împrăștierea totală a datelor.

**La test poți spune:** „BE10 are masa egală cu a celorlalte regiuni și un aport la inerția totală de aproximativ 0,6992.”

**Reține:** masa nu este populația regiunii. Inerția 0,6992 nu este automat 69,92%; aici totalul inerției este 12.

La 116 regiuni, contribuția egală la o axă ar fi aproximativ 0,862% de regiune. BE10, cu 19% pe PC2, este mult peste această referință.

## 7. Ce înseamnă sumele din output?

| Ce aduni | Rezultat | Traducere |
|---|---|---|
| Contribuțiile tuturor indicatorilor la o axă | 100% | Toate aporturile formează axa |
| Cos² pentru același indicator pe toate axele | 1 | Toate axele împreună descriu tot indicatorul |
| Cos² pentru toți indicatorii pe aceeași axă | Lambda | În ACP standardizată, obții varianța acelei axe |
| Contribuțiile tuturor regiunilor la o axă | 100% | Toate aporturile regiunilor formează axa |
| Cos² ale aceleiași regiuni pe toate axele | 1 | Toate axele descriu întregul profil față de centru |

**Exemplu:** suma cos² a tuturor indicatorilor pe PC1 este 6,714. Spui: „Suma coincide cu lambda1, deci cu varianța primei componente.”

Regula cos²=1 pentru o regiune presupune că nu se află exact în centrul datelor. Nu aduni contribuțiile aceluiași indicator pe axe presupunând că vor da 100%.

[Înapoi](00_INCEPE_AICI.md) · [Urmează: grafice](04_GRAFICE_INTERPRETATE.md)
