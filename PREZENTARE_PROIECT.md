# Fișa mea de prezentare — digitalizare și dezvoltare regională

Actualizare: **5 noiembrie 2026**. Acoperă toate cerințele din **Seminarii 1–2, 4–5 și 5–6**, inclusiv tema pentru seminarul 3.

## Ce rețin înainte de orice

**2024 · Eurostat · 116 regiuni NUTS2 · 21 de țări · 12 indicatori · 4 componente · 85,06%**

> Am analizat asocierea dintre digitalizare și dezvoltarea economică regională, folosind 12 indicatori Eurostat pentru anul 2024. Am descris distribuțiile și corelațiile, apoi am aplicat ACP pe date standardizate. Am păstrat patru componente, care explică 85,06% din variație. Am verificat contribuțiile și calitatea reprezentării și am reprezentat simultan primele patru componente.

Întrebarea proiectului: **regiunile cu participare digitală mai mare tind să aibă un profil economic și social mai favorabil?** Rezultatele descriu asocieri, fără a demonstra cauzalitate.

## Datele și pregătirea lor

Sursa este **`centralizare.xlsx`, foaia `Date complete`**. Excelul de intrare a fost citit și păstrat intact. `digitalizare.txt` coincide numeric și ca ordine a regiunilor cu Excelul.

| Cod | Indicator | Unitate / populație |
| --- | --- | --- |
| X1 | Internet acasă | % gospodării |
| X2 | Internet zilnic | % persoane 16–74 |
| X3 | Internet banking | % persoane 16–74 |
| X4 | Cumpărături online | % persoane 16–74 |
| X5 | PIB/locuitor | PPS/locuitor |
| X6 | Ocupare | % populație 20–64 |
| X7 | Șomaj general | % activi 20–64 |
| X8 | Șomaj tineri | % activi 15–24 |
| X9 | Studii superioare | % populație 25–64 |
| X10 | Formare adulți | % populație 25–64 |
| X11 | NEET | % populație 15–29 |
| X12 | Densitate | locuitori/km² |

- O observație este o regiune; o variabilă este un indicator. Codul, țara, numele și anul sunt identificatori.
- Datele sunt cantitative, observaționale, de profil: toate pentru **2024**.
- Din **244 de regiuni centralizate**, 116 au date complete; celelalte 128 au cel puțin o lipsă. Rata de păstrare este 47,54%.
- Asocierea s-a făcut în Excel prin **VLOOKUP cu potrivire exactă**, după codul regiunii. Foile `Sursa X1`–`Sursa X12` păstrează metadatele.
- Lipsurile și valorile excluse pentru flagurile `u` / `c` nu sunt înlocuite cu zero. Nu împrumutăm valori din alți ani.
- Actualizarea folosește anul deja extras; nu a refăcut comparația disponibilității pentru 2022 și 2023.
- Regiunile au ponderi egale. Media lor nu este media UE ponderată cu populația.
- PPS înseamnă standard al puterii de cumpărare; NEET înseamnă tineri neocupați care nu participă la educație sau formare.
- Șomajul general este pentru **20–64 ani**, iar șomajul tinerilor pentru **15–24 ani**. Ratele de șomaj au drept bază populația activă.

## Ce am folosit din cursuri

- **C1–C2, pp. 16–20 și 29–35:** clasificarea datelor, medie, varianță, corelație, standardizare și descompunere spectrală.
- **cap1 — ACP, pp. 4–9:** scopul ACP, maximizarea varianței sub restricția normei unitare, proprietăți, selecția axelor și matricea factor.
- **cap1 — ACP, p. 16 și seminar 5–6, p. 2:** cos² și contribuțiile variabilelor.
- Cursul de corespondențe studiază variabile **calitative** și tabele de contingență. Nu este cerut de cele trei seminarii și nu se aplică direct matricei noastre de indicatori numerici.
- Exemplul din curs elimină anumite variabile și extreme într-un alt set. Nu copiem mecanic acea selecție: aici păstrăm cei 12 indicatori, în absența unor erori demonstrate.

## Statistici descriptive, distribuții și outlieri

Media descrie nivelul mediu, mediana centrul distribuției, abaterea standard dispersia, iar Q1–Q3 jumătatea centrală. Pentru procente, abaterea standard este în **puncte procentuale**.

Exemplu: X7 are media **6,54%**, mediana **6,30%** și abaterea standard **3,13 puncte procentuale**.

PIB-ul și densitatea au cozi pronunțate spre dreapta. Ocuparea are câteva valori mult mai reduse decât restul. Standardizarea permite compararea scărilor, dar nu elimină asimetria.

Outlierii sunt identificați prin **1,5 IQR**, cu balamalele Tukey folosite de `boxplot.stats()`. Cuantilele descriptive folosesc convenția `quantile(type=7)`; cele două nu trebuie confundate. Păstrăm extremele ca profiluri regionale reale. Lista cu regiunile și valorile este în `rezultate/outlieri.csv`.

Grafice: histograme, boxploturi originale și standardizate, matricea observațiilor, matricea Pearson, grafic cu trei și grafic cu patru variabile.

## Corelațiile și graficele cu variabilele originale

- Internet zilnic–PIB: **Pearson 0,585**, **Spearman 0,662**.
- Internet banking–cumpărături online: **0,845**, asociere pozitivă puternică.
- Ocupare–șomaj general: **-0,739**; ocupare–NEET: **-0,839**.

> Regiunile cu utilizare zilnică mai ridicată a internetului tind să aibă PIB/locuitor mai mare în eșantionul analizat.

Graficul cu **trei variabile**: X = internet zilnic, Y = PIB, culoare = ocupare. Graficul cu **patru variabile** adaugă aria punctului = studii superioare. Punctele reprezintă regiuni; mărimea nu reprezintă populația.

## ACP: ce face și de ce standardizez

ACP construiește combinații liniare ale indicatorilor, ordonate după varianța explicată. Prima axă maximizează varianța; fiecare următoare maximizează variația rămasă, sub restricția de ortogonalitate.

`Z = (X − medie) / abatere standard`

Indicatorii au unități și dispersii diferite; de aceea folosim ACP pe **matricea de corelație**. Coloanele standardizate au medie zero și varianță unu în convenția aleasă. Standardizarea nu produce automat distribuții normale.

Din curs: **R · v = λ · v**, coeficienții au normă unitară, iar **Var(PC) = λ**. Cele 12 axe conservă varianța totală și generalizată; componentele sunt necorelate. Necorelarea nu implică independență.

| Obiect | Semnificație |
|---|---|
| `lambda` | Varianța componentei |
| `acp$sdev` | Rădăcina pătrată din lambda |
| `acp$loadings` | Coeficienții combinațiilor liniare, adică vectorii proprii |
| `acp$scores` | Coordonatele regiunilor pe noile axe |
| `cor(X, acp$scores)` | Matricea factor: corelațiile indicator–componentă |

Suma valorilor proprii este **12**. Matricea scorurilor complete este **116 × 12**; soluția reținută are **116 × 4**.

## De ce păstrez patru componente

| Axe | Variație pe axă | Variație cumulată |
| --- | --- | --- |
| PC1 | 55,95% | 55,95% |
| PC2 | 14,39% | 70,34% |
| PC3 | 9,13% | 79,47% |
| PC4 | 5,59% | 85,06% |

**Kaiser recomandă 3 axe** cu λ > 1. Ele explică 79,47%, sub pragul de 80% ales în proiect; reținem **4 axe**, cu 85,06%. Scree plotul completează decizia, fără să înlocuiască justificarea pragului. Cursul mai enumeră analiza paralelă și criteriul statistic; acestea nu sunt impuse de cerințele PDF și nu au fost pretinse ca executate.

## Numele și interpretarea componentelor

| Componentă | Denumire | Variație |
| --- | --- | --- |
| PC1 | Participare digitală și integrare economică și socială | 55,95% |
| PC2 | Profil mixt al pieței muncii, educației și teritoriului | 14,39% |
| PC3 | Concentrare urbană și economică versus formare continuă | 9,13% |
| PC4 | Acces la internet versus studii superioare | 5,59% |

**PC1:** indicatorii digitali, ocuparea, educația și PIB au semn pozitiv; șomajul și NEET au semn negativ. Un scor ridicat indică un profil relativ favorabil în aceste dimensiuni. Componenta depășește digitalizarea propriu-zisă.

**PC2:** șomajul general (0,69), șomajul tinerilor (0,55), densitatea (0,52) și studiile superioare (0,49) sunt în sens opus ocupării (-0,38). Este un profil mixt; pozitiv nu înseamnă automat mai bine. Indicatorii regionali nu arată că persoanele cu studii superioare sunt cele șomere.

**PC3:** densitatea (0,71) și PIB (0,44) se opun formării adulților (-0,39). **PC4:** accesul la internet acasă (0,61) se opune studiilor superioare (-0,36). Sunt contraste descriptive suplimentare, fără interpretare cauzală.

Semnele sunt acum **uniformizate între scripturi, Excel și raport** pentru primele patru axe. O axă și opusul ei reprezintă aceeași soluție; trebuie inversate împreună coeficienții, coordonatele variabilelor și scorurile.

## Cum interpretez biplotul

Biplotul combină regiunile cu săgețile indicatorilor. Axele sunt numite după componente. Există și o variantă cu **PC1 pe verticală**; inversarea axelor schimbă orientarea desenului, fără să schimbe analiza.

- Dreapta: participare digitală, ocupare, educație și PIB mai mari în profilul sintetizat de PC1; stânga: profil opus, asociat șomajului și NEET.
- Sus pe PC2: profil mixt, inclusiv șomaj, densitate și studii superioare. BE10 și AT13 se disting pe această axă.
- Săgețile digitale au direcții apropiate; ocuparea și șomajul sunt orientate opus.
- Apropierea regiunilor arată asemănare **în proiecție**, dacă reprezentarea este bună. Planul PC1–PC2 explică 70,34%, nu întreaga soluție.
- Biplotul `princomp` are două scări. Pentru corelații și lungimea săgeților consultăm **cercul corelațiilor și matricea factor**, nu citim numeric săgețile biplotului ca și când ar fi corelații.

## Seminar 5–6: coordonate, cos² și contribuții

Pentru variabila j și componenta k:

- **Coordonată** = `cor(X_j, PC_k)` = element din matricea factor.
- **Cos²** = coordonată²; arată cât din variația variabilei este reprezentată de axă.
- **Contribuție (%)** = `100 × cos² / lambda_k`; arată aportul la varianța axei.
- Suma cos² pe o **coloană** este lambda; suma contribuțiilor pe o coloană este 100%. Suma cos² pe **toate cele 12 axe**, pentru o variabilă, este 1.
- Referința unei contribuții egale: **100/12 = 8,33%**. Este o referință descriptivă, nu un test statistic.

| Axă | Cele mai mari trei contribuții ale variabilelor |
| --- | --- |
| PC1 | X11: 12,25%; X4: 12,09%; X3: 11,66% |
| PC2 | X7: 27,91%; X8: 17,28%; X12: 15,38% |
| PC3 | X12: 46,21%; X5: 17,77%; X10: 14,15% |
| PC4 | X1: 55,07%; X9: 19,00%; X2: 15,17% |

**Exemplu X12:** cos² în PC1–PC2 este **0,300**, iar în primele patru axe **0,816**. Densitatea este descrisă mult mai bine când includem PC3. Contribuția și calitatea reprezentării răspund la întrebări diferite.

Pentru regiunea i:

`d_i² = suma_j Z_n[i,j]²`

`cos²_ik = scor_ik² / d_i²`

`contribuție_ik (%) = 100 × scor_ik² / (116 × lambda_k)`

`Dist` este **rădăcina lui d²**, nu d². Regiunile au masa **1/116**, iar inerția regiunii este **d²/116**. Suma contribuțiilor regiunilor pe fiecare axă este 100%. Referința egală este **0,862%**. Pentru cos² pe un plan adunăm valorile celor două axe.

## Tema: primele patru componente într-un singur grafic

În `Seminarii_5_6.R`, graficul `grafic_4CP` folosește:

- **X = PC1**, **Y = PC2**;
- **culoare = PC3**, pe o scală divergentă centrată la zero;
- **mărime = PC4**, pe o scală crescătoare: un punct mai mare are un scor PC4 mai mare, inclusiv când există scoruri negative.

Legenda mărimii arată scorul PC4, nu populația și nici modulul scorului. Poziția rezumă 70,34% din variație; culoarea și mărimea adaugă informația axelor 3 și 4. Graficul încorporează cele patru scoruri, fără să reprezinte fidel distanțele euclidiene în patru dimensiuni. Planul separat PC3–PC4, cu 14,72%, completează lectura.

Fișier vizual deja generat: `rezultate/grafice/16_primele_patru_componente.png`. Codul `ggplot()` corespunzător este pregătit în R și nu a fost executat în această actualizare.

## România

| Regiune | PC1 | PC2 | PC3 | PC4 | Cos² PC1–PC2 | Cos² primele 4 |
| --- | --- | --- | --- | --- | --- | --- |
| Nord-Vest | -2,754 | -1,241 | 0,621 | 1,698 | 0,579 | 0,786 |
| Centru | -3,622 | -1,485 | 1,096 | 1,637 | 0,692 | 0,867 |
| Nord-Est | -3,705 | -2,030 | 0,822 | 1,037 | 0,834 | 0,916 |
| Sud-Muntenia | -4,604 | -0,853 | 0,252 | 1,124 | 0,847 | 0,898 |
| Sud-Vest Oltenia | -5,763 | -0,615 | 0,775 | 0,850 | 0,909 | 0,945 |
| Sud-Est | -6,140 | 0,093 | 0,210 | 0,806 | 0,893 | 0,910 |

Toate cele șase regiuni incluse au PC1 negativ față de media eșantionului. **Nord-Vest** are cel mai mare scor PC1 dintre ele; **Sud-Est** are cel mai mic. Cos² arată cât de bine justifică proiecția lectura fiecărei regiuni.

**București–Ilfov și Vest** sunt excluse deoarece X8 este indisponibil, cu flag `u`. Nu le atribuim scoruri și nu deducem poziția pe care ar fi avut-o. Scor negativ nu înseamnă valori negative ale indicatorilor.

## Calculul manual și comparația metodelor

`scale(X)` folosește abaterea standard cu divizor **n−1**; `princomp(cor=TRUE)` și `PCA(scale.unit=TRUE)` folosesc standardizarea cu **n** pentru coordonate. De aceea:

```r
sqrt(n / (n - 1)) * scale(X) %*% acp$loadings
```

reproduce scorurile `princomp`. Matricea factor se obține și prin `loadings × sqrt(lambda)`, pe coloane. După alinierea semnelor, `PCA$ind$coord` se compară cu scorurile, iar `PCA$var$coord` cu matricea factor.

**Starea verificării:** au fost efectuate **22 verificări numerice în Python**, pe datele Excel: descompunere spectrală, SVD independentă, identități ale cos² și contribuțiilor, reconstrucție și acord cu valorile deja salvate în Excel. Eroarea maximă este **1.18e-12**, sub toleranța 1e−8. **Scripturile R nu au fost executate**, conform cerinței tale; sintaxa celor patru fișiere a fost verificată separat cu `parse()`, fără evaluarea comenzilor. Nu există un output R nou. Codul de comparare `princomp`–`PCA` și verificările aferente sunt pregătite în `Seminarii_5_6.R`.

## Ce conține fiecare fișier

| Fișier | Rol |
|---|---|
| `pregatire_date.R` | Import Excel, verificare TXT și funcții de aliniere a axelor |
| `Seminarii_1_3.R` | Cerințele 1–2 și tema cu trei/patru variabile |
| `Seminarii_4_5.R` | ACP, calcule manuale, selecție, biploturi și comparație |
| `Seminarii_5_6.R` | Coordonate, cos², contribuții și tema cu patru componente |
| `raport_proiect.pdf` | Rezolvarea explicată, cu tabele și grafice |
| `rezultate/rezultate_seminarii.xlsx` | Toate rezultatele numerice, pe toate cele 12 axe |
| `rezultate/cerinte.csv` | Corespondența fiecărei cerințe PDF cu rezolvarea |
| `rezultate/verificari_numerice.csv` | Verificări efectuate în Python |
| `rezultate/metadate.json` | Sursa, metoda și starea execuției |
| `construieste_raport.py`, `redactare_proiect.py` | Refacerea documentelor în Python, fără executare R |

La executarea manuală, codul R salvează rezultatele în **`rezultate_R`**, separat de cele deja calculate în Python. Nu instalează automat pachete. Lista pentru instalare manuală este în `pregatire_date.R`.

## Întrebări la care să fiu pregătit

**De ce patru axe?** Primele trei rămân sub pragul ales de 80%; patru explică 85,06%.

**Ce diferență există între contribuție și cos²?** Contribuția arată cine construiește axa; cos² arată cât de bine este reprezentată o variabilă sau regiune.

**De ce densitatea pare slab reprezentată în cercul PC1–PC2?** O parte mare din variația sa este pe PC3; calitatea în planul primelor două axe este numai 0,300.

**Un scor mare pe PC2 este bun?** Nu automat: șomajul, studiile superioare și densitatea au aici același semn.

**Sunt toate cele 116 regiuni un eșantion aleator?** Nu. Sunt cazurile cu date complete din centralizarea existentă; selecția poate influența concluziile.

**Am demonstrat că digitalizarea crește PIB-ul?** Nu; analiza este descriptivă și observațională, pentru un singur an.

## Cum închei

> În regiunile analizate, participarea digitală se asociază cu un profil economic și social mai favorabil. Patru componente rezumă 85,06% din variația celor 12 indicatori. Interpretarea este susținută de matricea factor, contribuții și cos² și se referă la regiunile cu date complete din 2024.
