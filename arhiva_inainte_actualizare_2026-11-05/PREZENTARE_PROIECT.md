# Fișa mea de învățare — digitalizare și dezvoltare regională

## Ce rețin înainte de orice

**2024 · Eurostat · 116 regiuni · 21 de țări · 12 indicatori · 4 componente · 85,06%**

- Întrebarea mea: regiunile cu utilizare digitală mai mare tind să aibă și un profil economic mai favorabil?
- Analizez regiuni în același an, nu evoluția în timp.
- Șomajul general este pentru **20–64 ani**, iar cel al tinerilor pentru **15–24 ani**.
- Internet zilnic–PIB: corelație Pearson **0,585**, pozitivă, moderată.
- Rezultatul arată **asociere**, nu dovedește cauzalitate.

## Cum încep, în cuvintele mele

> Am analizat legătura dintre digitalizare și dezvoltarea economică regională. Am folosit 12 indicatori Eurostat din 2024, pentru 116 regiuni NUTS2. Mai întâi am descris datele și corelațiile, apoi am folosit analiza componentelor principale pentru a rezuma informația. Am păstrat patru componente, care explică aproximativ 85% din variația datelor.

## Datele: ce trebuie să pot explica

**O observație = o regiune. O variabilă = un indicator.**

NUTS2 este un nivel al clasificării statistice regionale europene. În România, Nord-Vest sau Centru sunt regiuni NUTS2; un județ nu este NUTS2.

| Cod | Ce înseamnă |
|---|---|
| X1 | Acces la internet acasă, % gospodării |
| X2 | Internet zilnic, % persoane 16–74 ani |
| X3 | Internet banking, % persoane 16–74 ani |
| X4 | Cumpărături online în ultimele 3 luni, % persoane 16–74 ani |
| X5 | PIB pe locuitor în PPS |
| X6 | Ocupare, % populație 20–64 ani |
| X7 | Șomaj, % populație activă 20–64 ani |
| X8 | Șomajul tinerilor, % populație activă 15–24 ani |
| X9 | Studii superioare, % populație 25–64 ani |
| X10 | Educație și formare în ultimele 4 săptămâni, % populație 25–64 ani |
| X11 | NEET, % populație 15–29 ani |
| X12 | Densitate, locuitori/km² |

- **PPS** = standard al puterii de cumpărare; permite compararea economiilor ținând cont de diferențele de preț. Nu este salariu în euro.
- **NEET** = tineri care nu sunt ocupați și nu participă la educație sau formare.
- **Populație activă** = persoane ocupate + șomeri. Aici se raportează rata șomajului.

### Cum am pregătit setul

1. Am asociat indicatorii după codul regiunii, prin `VLOOKUP` cu potrivire exactă.
2. Am tratat drept indisponibile lipsurile și valorile marcate cu fiabilitate redusă sau confidențialitate.
3. Am păstrat numai regiunile cu toți cei 12 indicatori disponibili.
4. Am exportat datele pentru R în TXT.

Din **244 de regiuni eligibile**, au rămas **116**; celelalte **128** au cel puțin o valoare indisponibilă. Nu am completat lipsurile cu zero.

Am ales 2024 deoarece avea cele mai multe cazuri complete dintre anii comparați: **95 în 2022, 103 în 2023, 116 în 2024**.

Fiecare regiune are aceeași pondere. Media eșantionului nu este media UE ponderată cu populația.

## Statistici și grafice: cum le explic

| Noțiune | Explicația scurtă |
|---|---|
| Media | Nivelul mediu al indicatorului în regiunile analizate |
| Mediana | Valoarea centrală; mai puțin sensibilă la extreme |
| Abaterea standard | Cât de dispersate sunt valorile |
| Q1 și Q3 | Delimitează jumătatea centrală a distribuției |
| Histogramă | Arată cum se distribuie valorile |
| Boxplot | Arată mediana, dispersia centrală și valorile extreme |

**Exemplul pe care îl pot da:** șomajul 20–64 ani are media **6,54%**, mediana **6,30%**, abaterea standard **3,13 puncte procentuale**.

**Outlier:** valoare dincolo de pragurile bazate pe regula 1,5 IQR. În boxplot, R folosește balamalele Tukey pentru calcul. O valoare extremă poate fi reală, de aceea am păstrat-o.

PIB și densitatea au cozi spre dreapta: câteva regiuni au valori mult mai mari decât celelalte.

### Corelațiile

- Pearson: asociere **liniară**, între −1 și +1.
- Pozitivă: valorile tind să crească împreună. Negativă: tind să varieze în sens opus.
- Aproape de zero: asociere liniară slabă; poate exista alt tip de relație.
- Internet zilnic–PIB: **Pearson 0,585** și **Spearman 0,662**. Spearman folosește rangurile.

**Ce spun:** „Regiunile cu utilizare zilnică mai ridicată a internetului tind să aibă PIB pe locuitor mai mare în acest eșantion.”

### Graficul cu patru variabile

**X = internet zilnic · Y = PIB · culoare = ocupare · aria punctului = studii superioare.**

Fiecare punct este o regiune. Mărimea punctului nu reprezintă populația. Graficul cu trei variabile folosește numai poziția și culoarea.

## ACP: ideea pe care trebuie să o înțeleg

**ACP = analiza componentelor principale.** Construiește variabile noi, numite componente, ca să rezume variația celor 12 indicatori.

Prima componentă surprinde cea mai mare variație. Următoarele surprind variația rămasă, pe direcții ortogonale. Componentele sunt necorelate; asta nu înseamnă automat independente.

### De ce standardizez

Indicatorii au unități și scări diferite. Fără standardizare, scările mari ar influența puternic rezultatul.

`z = (valoare − medie) / abatere standard`

După standardizare: medie zero și varianță unu în convenția folosită. Standardizarea nu elimină extremele și nu face automat distribuția normală.

### Trei noțiuni pe care să nu le încurc

| Noțiune | Ce îmi spune |
|---|---|
| Valoare proprie, λ | Câtă variație surprinde componenta |
| Loadings în `princomp` | Coeficienții combinației liniare; vectorii proprii unitari |
| Scores | Coordonatele fiecărei regiuni pe componente |
| Matricea factor | Corelațiile indicatorilor cu componentele; o folosesc la interpretare |

Suma valorilor proprii este **12**, deoarece lucrez pe matricea de corelație a 12 indicatori. `sdev` este rădăcina pătrată a valorii proprii.

Scoruri complete: **116 × 12**. Scoruri pentru soluția păstrată: **116 × 4**.

### De ce păstrez patru componente

| Componente | Variație explicată cumulat |
|---|---:|
| Prima | 55,95% |
| Primele două | 70,34% |
| Primele trei | 79,47% |
| Primele patru | **85,06%** |

- **Kaiser:** trei valori proprii sunt mai mari decât 1.
- **Criteriul ales:** minimum 80% din variație → păstrez patru componente.
- **Scree plot:** urmăresc unde scăderea valorilor proprii începe să se aplatizeze.

**Răspuns de reținut:** „Trei componente sunt recomandate de Kaiser, dar explică 79,47%. Pentru pragul meu de minimum 80%, am păstrat patru.”

Graficul pe PC1–PC2 arată **70,34%**, nu toată informația celor patru componente.

## Cum interpretez componentele

### PC1 — participare digitală și integrare economică și socială

- Pozitiv: indicatorii digitali, ocuparea, educația și PIB.
- Negativ: șomajul și NEET.
- Un scor mare descrie un profil relativ mai favorabil pe aceste dimensiuni, în eșantion.

Nu o numesc indicator pur al digitalizării: include și piața muncii, educația și economia.

### PC2 — profil mixt al pieței muncii, educației și teritoriului

Corelații: șomaj general **+0,69**, șomaj tineri **+0,55**, densitate **+0,52**, studii superioare **+0,49**, ocupare **−0,38**.

Un scor pozitiv nu înseamnă automat o situație mai bună.

### PC3 și PC4 — diferențe suplimentare

- **PC3**, cu semnele din PDF și Excel: mai ales densitate **+0,71**, PIB **+0,44**, formarea adulților **−0,39**.
- **PC4:** acces la internet acasă **+0,61**, studii superioare **−0,36**.

**Atenție la PC3:** în scriptul `princomp`, semnele sunt inversate față de PDF și Excel. O axă și opusul ei reprezintă aceeași soluție. Se inversează împreună coeficienții și scorurile; variația explicată rămâne aceeași.

### Cum citesc graficele ACP

- **Graficul regiunilor:** punctele sunt regiunile. Apropierea indică profiluri asemănătoare în proiecția afișată; verific și calitatea reprezentării.
- **Cercul corelațiilor:** săgeți lungi = variabile bine reprezentate în plan; direcții apropiate sugerează asociere pozitivă, opuse sugerează asociere negativă, dacă reprezentarea este bună.
- **Biplot:** regiuni și variabile împreună. Nu compar direct scara punctelor cu cea a săgeților.
- **Contribuție:** aport la construirea axei.
- **Cos²:** calitatea reprezentării pe axă sau în plan.

## România: ce rețin

Sunt incluse șase regiuni. Toate au PC1 negativ față de media eșantionului, care este zero.

- **Nord-Vest:** cel mai mare PC1 dintre regiunile românești incluse, **−2,754**.
- **Sud-Est:** cel mai mic, **−6,140**.
- **București–Ilfov și Vest:** excluse deoarece X8, șomajul tinerilor, este indisponibil, cu marcaj de fiabilitate redusă.

Scor negativ nu înseamnă indicatori negativi. Nu este un clasament oficial și nu pot spune ce poziție ar fi avut regiunile excluse.

## R: ce face fiecare comandă

| Comandă | Ce trebuie să spun |
|---|---|
| `read.table(..., header=TRUE, row.names=1, sep="\t")` | Importă TXT; prima coloană devine identificator, nu indicator numeric |
| `dim(X)` | Numărul de regiuni și indicatori: 116 × 12 |
| `apply(X, 2, mean)` | Media fiecărei coloane; `2` înseamnă coloane |
| `apply(X, 2, sd)` | Abaterile standard |
| `apply(X, 2, quantile)` | Cuantilele |
| `hist()`, `boxplot()`, `plot()` | Distribuții, extreme, relații între variabile |
| `boxplot(scale(X))` | Distribuții pe o scară standardizată |
| `cor(X)`, `corrplot(R)` | Calculează și reprezintă corelațiile |
| `scale(X)` | Centrează și standardizează |
| `eigen(R)` | Valorile și vectorii proprii ai matricei de corelație |
| `princomp(X, cor=TRUE, scores=TRUE)` | ACP pe corelații, cu scorurile regiunilor |
| `summary(acp)` | Abaterile standard și proporțiile de variație explicată |
| `cor(X, scoruri)` | Matricea factor |
| `biplot(acp)` | Regiunile și variabilele în același plan |
| `PCA(X, scale.unit=TRUE, ncp=12, graph=FALSE)` | ACP cu FactoMineR; standardizare, toate coordonatele, fără grafice automate |
| `fviz_eig`, `fviz_pca_ind`, `fviz_pca_var` | Variație explicată, regiuni, variabile |

### Dacă mă întreabă despre calculul manual

`scale(X) %*% acp$loadings` combină indicatorii standardizați cu coeficienții axelor. `%*%` înseamnă înmulțire de matrice.

Pentru scorurile exacte din `princomp`, aplic corecția:

```r
sqrt(n / (n - 1)) * scale(X) %*% acp$loadings
```

Motiv: `scale()` folosește divizorul **n−1** la calculul varianței, iar `princomp` folosește **n** pentru standardizarea din scoruri.

### De ce am folosit și FactoMineR

Verific aceeași analiză prin altă funcție și obțin graficele cerute. Valorile proprii coincid numeric; scorurile corespunzătoare au corelații **+1 sau −1**, în funcție de orientarea axelor.

`ncp=12` permite comparația tuturor componentelor. Alegerea mea pentru interpretare rămâne **patru**.

## Întrebări la care să fiu pregătit

**De ce șomaj 20–64?** Este grupa disponibilă în tabelul regional ales, respectă limita de vârstă cerută și coincide cu grupa ocupării.

**De ce nu am eliminat extremele?** O valoare extremă poate reflecta o caracteristică reală a regiunii; nu este automat o eroare.

**De ce nu două componente?** Primele două explică numai 70,34%; pentru minimum 80% am nevoie de patru.

**Pot generaliza la toată UE?** Cu prudență: am numai regiunile cu date complete, iar selecția poate influența rezultatele.

**Am demonstrat că digitalizarea crește PIB-ul?** Nu. Analiza este descriptivă; alți factori pot influența simultan digitalizarea și economia.

**Ce alte limite există?** Un singur an, ponderi egale ale regiunilor, sensibilitate la extreme și faptul că PIB nu descrie singur bunăstarea.

## Cum închei

> În regiunile analizate, participarea digitală se asociază cu profilul economic și social. Patru componente rezumă 85,06% din variația celor 12 indicatori. Rezultatele sunt descriptive și se referă la eșantionul cu date complete.

## Recapitulare în 30 de secunde

**Tema → datele → pregătirea → statistici → corelații → standardizare → ACP → patru componente → România → limite.**

Cifrele pe care le învăț: **2024; 116; 12; 20–64; 0,585; 55,95%; 70,34%; 79,47%; 85,06%.**

Dacă demonstrez în RStudio: deschid scriptul → **Session → Set Working Directory → To Source File Location** → rulez pe rând cu **Cmd+Enter** pe Mac. Dacă lipsesc pachetele, rulez o singură dată liniile `install.packages(...)` după eliminarea semnului `#`.
