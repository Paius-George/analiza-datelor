# Model 02 — Educație și ocupare

Variantă de antrenament creată după modelul profesorului. Date sintetice, fără semnificație statistică oficială.

40 minute · 9 puncte + 1 punct din oficiu. Barem orientativ de pregătire.

- X1: Studii superioare
- X2: Formare adulți
- X3: Absolvenți STEM
- X4: Ocupare totală
- X5: Ocuparea femeilor
- X6: Șomaj
- X7: NEET
- X8: Abandon școlar

## 1. (1p) Analizați matricea de corelație pentru datele numerice inițiale. Formulați o concluzie privind aplicarea analizei componentelor principale.

```text
cor()  X1      X2      X3      X4      X5      X6      X7      X8
X1     1.000   0.596   0.709   0.681   0.179   -0.456  -0.159  -0.190
X2     0.596   1.000   0.851   0.764   0.672   -0.645  -0.478  0.488
X3     0.709   0.851   1.000   0.791   0.533   -0.620  -0.380  0.249
X4     0.681   0.764   0.791   1.000   0.404   -0.465  -0.258  0.275
X5     0.179   0.672   0.533   0.404   1.000   -0.691  -0.758  0.610
X6     -0.456  -0.645  -0.620  -0.465  -0.691  1.000   0.725   -0.384
X7     -0.159  -0.478  -0.380  -0.258  -0.758  0.725   1.000   -0.516
X8     -0.190  0.488   0.249   0.275   0.610   -0.384  -0.516  1.000
```

**Răspuns-model:** Există asocieri între variabile: X2–X3: r = 0.851; X3–X4: r = 0.791. Sunt 15 perechi cu |r| ≥ 0,50 din 28. Indicatorii conțin informație comună, deci ACP este justificată ca metodă de reducere a dimensionalității; nu deducem cauzalitate din corelații.

**Pe înțelesul tău:** Ignoră diagonala de 1. Caută valori apropiate de +1 sau −1. Semnul spune direcția; modulul spune cât de puternică este asocierea. Mai multe corelații consistente sugerează informație repetată pe care ACP o poate sintetiza. Aceasta este o justificare exploratorie, nu un test formal de adecvare.

- 0.5p: Citezi două corelații și sensul lor.
- 0.5p: Legi informația comună de utilitatea ACP.

## 2. (2p) Folosiți două criterii pentru a decide numărul de componente păstrate în analiză.

```text
Componentă  Valoare proprie  % variație  % cumulat
1           4.653            58.162      58.162
2           1.714            21.421      79.584
3           0.730            9.127       88.711
4           0.261            3.256       91.967
5           0.230            2.878       94.845
6           0.171            2.135       96.980
7           0.150            1.880       98.859
8           0.091            1.141       100.000
```

**Răspuns-model:** Prin Kaiser, pentru ACP pe variabile standardizate, păstrez 2 componente cu λ > 1, care explică 79.58% din variație. Prin criteriul variației cumulate, aleg un prag explicit de 80% și păstrez 3 componente (88.71%). Criteriile dau rezultate diferite. Dacă urmăresc minimum 80% informație, aleg 3; dacă aplic strict Kaiser, aleg 2. Pragul de 80% este o alegere de lucru, nu o regulă universală.

**Pe înțelesul tău:** Kaiser: numeri valorile proprii strict peste 1. Cumulat: citești de sus în jos până ajungi pentru prima dată la pragul ales. Nu confunda procentul unei componente cu procentul cumulat. Nu forța criteriile să dea același număr.

- 1p: Aplici Kaiser și indici numărul corect.
- 1p: Precizezi pragul și primul număr care îl atinge; justifici alegerea.

## 3. (2p) Folosiți matricea factor pentru a interpreta a doua componentă principală.

```text
Matricea factor  Dim1    Dim2
X1               0.608   0.707
X2               0.918   0.125
X3               0.866   0.355
X4               0.776   0.418
X5               0.800   -0.444
X6               -0.828  0.150
X7               -0.696  0.510
X8               0.527   -0.646
```

**Răspuns-model:** Componenta 2 opune valorile ridicate pentru Studii superioare (X1, r = 0.707), NEET (X7, r = 0.510) valorilor ridicate pentru Abandon școlar (X8, r = -0.646), Ocuparea femeilor (X5, r = -0.444). Ea explică 21.42% din variația totală. O numesc „contrastul dintre Studii superioare / NEET și Abandon școlar / Ocuparea femeilor”. Denumirea este descriptivă; nu presupune că axa măsoară exclusiv un singur fenomen.

**Pe înțelesul tău:** Te uiți doar la coloana a doua. Alegi coeficienții cei mai mari în valoare absolută, inclusiv pe cei negativi. Plus înseamnă variație în același sens cu axa, minus în sens opus. Numele componentei trebuie să reflecte indicatorii dominanți, chiar dacă rezultă un profil mixt.

- 1p: Identifici indicatorii dominanți și coeficienții lor pe PC2.
- 1p: Explici sensurile, propui un nume susținut și precizezi variația explicată.

## 4. (2p) Din outputul numeric privind variabilele interpretați coloanele Dim1, Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.

```text
Variabilă  Dim1    Dim2    ctr1 (%)  ctr2 (%)
X1         0.608   0.707   7.941     29.155
X2         0.918   0.125   18.111    0.910
X3         0.866   0.355   16.113    7.345
X4         0.776   0.418   12.928    10.203
X5         0.800   -0.444  13.753    11.495
X6         -0.828  0.150   14.752    1.318
X7         -0.696  0.510   10.424    15.201
X8         0.527   -0.646  5.978     24.373
```

**Răspuns-model:** Dim1 și Dim2 sunt corelațiile indicatorilor cu componentele, cu valori între −1 și 1. De exemplu, X2 (Formare adulți) are r = 0.918 cu PC1 și r = 0.125 cu PC2. Semnul indică sensul, iar |r| intensitatea. ctr1 și ctr2 arată procentul cu care variabila participă la construirea fiecărei axe. X2 are ctr1 = 18.11%, iar X1 are ctr2 = 29.15%, peste reperul mediu de 12.50% = 100/8. Contribuțiile se adună la 100% separat pe fiecare componentă, înainte de rotunjire.

**Pe înțelesul tău:** Dim = cât de strâns și în ce sens se leagă variabila de axă. ctr = cât ajută variabila la construirea axei. O corelație negativă poate avea o contribuție mare: contribuția nu are semn. ctr NU este procentul din variabilă explicat de axă; pentru acesta folosești cos², adică aici pătratul corelației.

- 1p: Interpretezi numeric Dim1 și Dim2, cu semn și intensitate.
- 1p: Interpretezi contribuțiile pentru ambele axe, reperul mediu și diferența față de cos².

## 5. (2p) Reprezentați grafic regiunile într-un spațiu definit de primele două componente principale. Extrageți 2 concluzii.

```text
Regiune  Scor PC1  Scor PC2  cos2 plan
R01002   4.144     0.475     0.922
R01027   -4.369    -0.539    0.853
R01020   -0.757    2.545     0.740
R01049   -2.085    -3.093    0.985
```

**Răspuns-model:** Graficul are PC1 pe orizontală și PC2 pe verticală; planul păstrează 79.58% din variație. Concluzia 1: R01002 este la extrema pozitivă a PC1 (4.144), iar R01027 la extrema negativă (-4.369); au profiluri opuse pe această axă. Capătul pozitiv este asociat mai ales cu Formare adulți (X2, r = 0.918), Absolvenți STEM (X3, r = 0.866), iar cel negativ cu Șomaj (X6, r = -0.828), NEET (X7, r = -0.696). Concluzia 2: R01020 are scorul PC2 maxim (2.545), iar R01049 minim (-3.093); diferența se interpretează prin contrastul PC2 de la cerința 3. cos² în plan pentru aceste două regiuni este 0.740, respectiv 0.985; interpretarea este cu atât mai sigură cu cât cos² este mai mare. Nu afirm că două regiuni sunt identice în toate variabilele doar fiindcă par apropiate în acest plan.

**Pe înțelesul tău:** Punct = regiune. Dreapta/stânga = scor pozitiv/negativ pe PC1. Sus/jos = scor pozitiv/negativ pe PC2. Tradu direcția prin indicatorii care definesc axa. Dă două concluzii despre regiuni numite concret. Apropierea sugerează profiluri asemănătoare în plan; verifică reprezentarea înainte de a generaliza.

- 0.5p: Reprezinți regiunile pe cele două axe etichetate și menționezi informația păstrată.
- 0.75p: Formulezi prima concluzie concretă, legată de PC1.
- 0.75p: Formulezi a doua concluzie concretă, legată de PC2; respecți limitele planului.

![Regiuni](model-02.svg)
