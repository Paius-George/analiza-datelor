# Model 15 — Cinci axe calculate nu înseamnă cinci păstrate

Variantă nouă după cerințele din fotografie și comenzile din „Cod test ACP.docx”. Date sintetice; outputuri didactice calculate în Python după definițiile funcțiilor, fără rulare R.

40 minute · 9p + 1p din oficiu. Barem orientativ.

**Capcana de urmărit:** PCA() calculează implicit până la 5 axe de coordonate. Acest ncp tehnic nu este numărul de axe ales prin Kaiser; tabelul valorilor proprii poate avea mai multe axe.

- X1: Internet acasă
- X2: Internet zilnic
- X3: Internet banking
- X4: Cumpărături online
- X5: PIB pe locuitor (PPS)
- X6: Ocupare 20–64 ani
- X7: Șomaj 20–64 ani
- X8: Șomaj tineri
- X9: Studii superioare
- X10: Formare adulți
- X11: NEET
- X12: Densitatea populației

## 1. (1p) Analizați matricea de corelație pentru datele numerice inițiale. Formulați o concluzie privind aplicarea analizei componentelor principale.

```r
cor(scale(X,center=T,scale=T))
```

```text
     X1      X2      X3      X4      X5      X6      X7      X8      X9      X10     X11     X12
X1   1.000   0.836   0.708   0.790   0.821   0.575   -0.657  -0.594  0.714   0.528   -0.616  0.442
X2   0.836   1.000   0.575   0.671   0.834   0.410   -0.538  -0.405  0.767   0.620   -0.588  0.421
X3   0.708   0.575   1.000   0.859   0.481   0.873   -0.849  -0.845  0.244   0.411   -0.708  0.030
X4   0.790   0.671   0.859   1.000   0.614   0.821   -0.833  -0.813  0.397   0.502   -0.717  0.178
X5   0.821   0.834   0.481   0.614   1.000   0.367   -0.442  -0.314  0.844   0.457   -0.403  0.610
X6   0.575   0.410   0.873   0.821   0.367   1.000   -0.815  -0.855  0.105   0.214   -0.587  0.025
X7   -0.657  -0.538  -0.849  -0.833  -0.442  -0.815  1.000   0.851   -0.194  -0.554  0.795   0.133
X8   -0.594  -0.405  -0.845  -0.813  -0.314  -0.855  0.851   1.000   -0.114  -0.405  0.706   0.151
X9   0.714   0.767   0.244   0.397   0.844   0.105   -0.194  -0.114  1.000   0.408   -0.250  0.651
X10  0.528   0.620   0.411   0.502   0.457   0.214   -0.554  -0.405  0.408   1.000   -0.767  -0.231
X11  -0.616  -0.588  -0.708  -0.717  -0.403  -0.587  0.795   0.706   -0.250  -0.767  1.000   0.239
X12  0.442   0.421   0.030   0.178   0.610   0.025   0.133   0.151   0.651   -0.231  0.239   1.000
```

**Pe înțelesul tău:** cor(scale(X)) este matricea de corelație a indicatorilor. Standardizarea nu schimbă corelațiile Pearson între coloane. Ignor diagonala de 1, discut semnul și modulul a două valori și abia apoi justific utilitatea ACP. Nu spun că ACP este interzisă când corelațiile sunt mici.

**Răspuns-model:** X3–X6 au r = 0.873, iar X3–X4 au r = 0.859. Sunt 39 perechi cu |r| ≥ 0,50 din 66. Corelațiile indică informație comună și justifică explorarea prin ACP. Semnul arată sensul asocierii, nu cauzalitatea.

- 0.5p: Citezi două corelații și sensul lor.
- 0.5p: Legi informația comună de utilitatea ACP.

## 2. (2p) Folosiți două criterii pentru a decide numărul de componente păstrate în analiză.

```r
summary(acp)
plot(acp,type="l")
summary(acp2)  # secțiunea Eigenvalues
```

```text
                        Comp.1   Comp.2   Comp.3   Comp.4   Comp.5   Comp.6   Comp.7   Comp.8   Comp.9   Comp.10  Comp.11  Comp.12
Standard deviation      2.662    1.608    1.111    0.436    0.405    0.388    0.365    0.349    0.327    0.293    0.275    0.258
Proportion of Variance  0.59042  0.21550  0.10278  0.01587  0.01367  0.01257  0.01109  0.01015  0.00894  0.00716  0.00629  0.00556
Cumulative Proportion   0.59042  0.80592  0.90871  0.92458  0.93825  0.95082  0.96191  0.97206  0.98099  0.98815  0.99444  1.00000

Eigenvalues           Dim.1   Dim.2   Dim.3   Dim.4   Dim.5   Dim.6   Dim.7   Dim.8   Dim.9   Dim.10  Dim.11  Dim.12
Variance              7.085   2.586   1.233   0.190   0.164   0.151   0.133   0.122   0.107   0.086   0.075   0.067
% of var.             59.042  21.550  10.278  1.587   1.367   1.257   1.109   1.015   0.894   0.716   0.629   0.556
Cumulative % of var.  59.042  80.592  90.871  92.458  93.825  95.082  96.191  97.206  98.099  98.815  99.444  100.000
```

**Pe înțelesul tău:** Citește trei lucruri separat: Standard deviation = abaterea componentei; pătratul ei = valoarea proprie; Proportion/Cumulative sunt proporții și se înmulțesc cu 100 pentru procente. Scree plot arată valorile proprii; cotul este un reper grafic, nu un număr impus fără justificare. Graficul plot(acp) afișează implicit cel mult primele 10 axe; tabelul este complet. ncp=5 implicit din PCA() nu înlocuiește criteriile de selecție.

**Răspuns-model:** Ridic la pătrat Standard deviation: pentru PC1, 2.662² ≈ 7.085; valorile nerotunjite dau rezultatul exact. Kaiser păstrează 3 componente cu λ > 1, echivalent sdev > 1 în această ACP standardizată. Acestea explică 90.87%. La un prag ales de 80%, primul număr suficient este 2, cu 80.59%. Dacă vreau minimum 80% din informație, aleg 2; aplicând strict Kaiser, aleg 3. Proportion of Variance pentru PC1 este 0.59042, adică 59.04%.

- 1p: Aplici Kaiser și indici numărul corect.
- 1p: Precizezi pragul și primul număr care îl atinge; justifici alegerea.

![Scree plot al valorilor proprii](model-15-scree.svg)

## 3. (2p) Folosiți matricea factor pentru a interpreta a doua componentă principală.

```r
scoruri <- acp$scores
MF=cor(X,scoruri)
corrplot(MF,method="number")
```

```text
MF   Comp.1  Comp.2  Comp.3  Comp.4  Comp.5  Comp.6  Comp.7  Comp.8  Comp.9  Comp.10  Comp.11  Comp.12
X1   0.899   0.303   0.035   0.054   0.156   0.019   0.072   0.214   0.021   0.047    0.127    0.041
X2   0.821   0.418   -0.189  -0.217  -0.012  0.157   -0.096  -0.005  -0.175  0.051    -0.023   0.020
X3   0.876   -0.281  0.236   -0.113  -0.004  0.175   -0.013  0.060   0.186   -0.084   -0.085   -0.031
X4   0.927   -0.112  0.169   -0.014  0.036   -0.194  -0.197  -0.017  0.018   -0.054   -0.020   0.131
X5   0.748   0.588   -0.014  0.019   -0.217  -0.065  0.077   -0.022  0.105   0.152    -0.050   0.036
X6   0.776   -0.371  0.442   -0.032  -0.093  0.028   -0.014  -0.140  -0.005  0.020    0.180    -0.053
X7   -0.867  0.381   -0.030  -0.005  0.157   0.089   -0.160  -0.097  0.141   0.116    0.039    0.012
X8   -0.799  0.463   -0.198  -0.252  -0.080  -0.057  0.057   0.011   0.076   -0.111   0.100    0.054
X9   0.562   0.753   -0.142  0.214   0.002   0.115   0.027   -0.125  -0.002  -0.140   0.016    0.041
X10  0.645   -0.063  -0.728  0.038   -0.051  -0.071  -0.127  0.039   0.054   -0.021   0.044    -0.132
X11  -0.808  0.327   0.362   0.105   -0.194  0.066   -0.168  0.158   -0.029  -0.026   0.025    -0.013
X12  0.197   0.841   0.442   -0.067  0.107   -0.137  0.004   -0.011  -0.020  -0.032   -0.044   -0.142
```

**Pe înțelesul tău:** Aici matricea factor chiar este cor(X, scoruri), deci numerele sunt corelații. Nu o confunda cu acp$loadings, unde sunt vectorii proprii. Citesc doar Comp.2, aleg coeficienții mari în modul, verific și minusurile și construiesc numele pe indicatorii dominanți. Pentru sensul regiunilor din fviz_pca_ind folosesc coordonatele PCA de la cerința 4: între metode semnul unei axe poate fi inversat.

**Răspuns-model:** Pe Comp.2 sunt asocieri pozitive mai importante pentru Densitatea populației (X12: 0.841), Studii superioare (X9: 0.753), PIB pe locuitor (PPS) (X5: 0.588) și negative pentru Ocupare 20–64 ani (X6: -0.371). Componenta explică 21.55% din variația totală. O denumire descriptivă posibilă este „contrast între Densitatea populației / Studii superioare / PIB pe locuitor (PPS)”, cu sensurile precizate mai sus.  Numele descrie asocieri din setul de date; nu demonstrează cauzalitate.

- 1p: Identifici indicatorii dominanți și coeficienții lor pe PC2.
- 1p: Explici sensurile, propui un nume susținut și precizezi variația explicată.

![Matricea factor cu valori numerice](model-15-factor.svg)

## 4. (2p) Din outputul numeric privind variabilele interpretați coloanele Dim1, Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.

```r
acp2 <- PCA(X,scale.unit=T,graph=T)
summary(acp2)  # secțiunea Variables
```

```text
Variables (the 10 first)
     Dim.1   ctr     cos2   Dim.2   ctr     cos2   Dim.3   ctr     cos2
X1   0.899   11.407  0.808  0.303   3.543   0.092  0.035   0.098   0.001
X2   0.821   9.521   0.675  0.418   6.753   0.175  -0.189  2.905   0.036
X3   0.876   10.842  0.768  -0.281  3.058   0.079  0.236   4.517   0.056
X4   0.927   12.138  0.860  -0.112  0.482   0.012  0.169   2.320   0.029
X5   0.748   7.887   0.559  0.588   13.349  0.345  -0.014  0.017   0.000
X6   0.776   8.489   0.601  -0.371  5.310   0.137  0.442   15.829  0.195
X7   -0.867  10.602  0.751  0.381   5.621   0.145  -0.030  0.072   0.001
X8   -0.799  9.015   0.639  0.463   8.292   0.214  -0.198  3.166   0.039
X9   0.562   4.456   0.316  0.753   21.924  0.567  -0.142  1.643   0.020
X10  0.645   5.869   0.416  -0.063  0.156   0.004  -0.728  43.023  0.531
```

**Pe înțelesul tău:** În fiecare grup de trei coloane citești: Dim = corelație, ctr = procent din construirea componentei, cos2 = cât de bine se vede variabila pe acea axă. Următorul grup este pentru componenta următoare. Nu aduni ctr de pe PC1 cu ctr de pe PC2 și nu tratezi ctr ca procent de reprezentare. Summary afișează implicit doar 10 elemente și 3 axe, deși analiza poate conține mai multe.

**Răspuns-model:** În Variables, Dim.1 și Dim.2 sunt corelații. Pentru X4, r cu PC1 este 0.927, iar cu PC2 este -0.112; semnul indică sensul, modulul intensitatea. ctr este contribuția la construirea axei: X4 are 12.14% pe PC1 și X9 are 21.92% pe PC2. Reperul mediu este 100/12 = 8.33%, calculat cu toate cele 12 variabile active. cos² pentru X4 pe PC1 este 0.860, adică 86.00% din variația sa reprezentată de această axă; în această ACP standardizată cos² = r². Tabelul arată doar primele 10 variabile, deci contribuțiile rândurilor vizibile nu trebuie să însumeze 100%. Primele două axe au aceeași orientare în cele două outputuri din această variantă.

- 1p: Interpretezi numeric Dim1 și Dim2, cu semn și intensitate.
- 1p: Interpretezi contribuțiile pentru ambele axe, reperul mediu și diferența față de cos².

## 5. (2p) Reprezentați grafic regiunile într-un spațiu definit de primele două componente principale. Extrageți 2 concluzii.

```r
fviz_pca_ind(acp2)
# Tabelul de mai jos selectează extremele din acp2$ind; nu este lista implicită a primelor 10.
```

```text
Individuals — selecție pentru verificarea concluziilor
         Dist   Dim.1   ctr    cos2   Dim.2   ctr     cos2
T15R054  7.048  6.563   7.598  0.867  -2.293  2.542   0.106
T15R002  7.867  -7.342  9.509  0.871  2.401   2.786   0.093
T15R017  6.552  4.326   3.301  0.436  4.683   10.601  0.511
T15R016  4.607  2.093   0.773  0.206  -3.625  6.351   0.619
```

**Pe înțelesul tău:** În Individuals, Dim este scorul unei regiuni, nu corelația unei variabile. Poate depăși ±1. ctr arată participarea regiunii la axă; cos² arată calitatea reprezentării, iar cos² pe plan = cos² pe PC1 + cos² pe PC2. Folosesc indicatorii din PCA pentru a numi direcțiile graficului. Două puncte apropiate sugerează profiluri asemănătoare în plan, fără a demonstra identitate în toate variabilele.

**Răspuns-model:** Graficul regiunilor folosește coordonatele din PCA, cu PC1 orizontală și PC2 verticală, și păstrează 80.59% din variație. Concluzia 1: T15R054 (PC1=6.563) și T15R002 (PC1=-7.342) au profiluri opuse pe PC1. Sensul pozitiv este asociat cu Cumpărături online (X4: 0.927), Internet acasă (X1: 0.899), Internet banking (X3: 0.876), iar cel negativ cu Șomaj 20–64 ani (X7: -0.867), NEET (X11: -0.808), Șomaj tineri (X8: -0.799). Concluzia 2: T15R017 (PC2=4.683) și T15R016 (PC2=-3.625) contrastează pe PC2, al cărei sens pozitiv este asociat cu Densitatea populației (X12: 0.841), Studii superioare (X9: 0.753), PIB pe locuitor (PPS) (X5: 0.588), iar cel negativ cu Ocupare 20–64 ani (X6: -0.371). cos² în plan pentru aceste ultime două regiuni este 0.947, respectiv 0.825; țin cont de calitatea reprezentării.

- 0.5p: Reprezinți regiunile pe cele două axe etichetate și menționezi informația păstrată.
- 0.75p: Formulezi prima concluzie concretă, legată de PC1.
- 0.75p: Formulezi a doua concluzie concretă, legată de PC2; respecți limitele planului.

![Regiuni](model-15.svg)

Surse tehnice: [R princomp](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/princomp.html), [summary.PCA](https://github.com/cran/FactoMineR/blob/master/R/summary.PCA.r), [svd.triplet](https://github.com/cran/FactoMineR/blob/master/R/svd.triplet.R).
