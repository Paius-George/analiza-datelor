# Model 18 — Regiuni: scor, ctr și cos2

Variantă nouă după cerințele din fotografie și comenzile din „Cod test ACP.docx”. Date sintetice; outputuri didactice calculate în Python după definițiile funcțiilor, fără rulare R.

40 minute · 9p + 1p din oficiu. Barem orientativ.

**Capcana de urmărit:** În Variables, Dim este o corelație. În Individuals, Dim este un scor de regiune, care poate depăși 1; ctr nu este cos2.

- X1: Internet acasă
- X2: Internet zilnic
- X3: Internet banking
- X4: Cumpărături online
- X5: PIB pe locuitor (PPS)
- X6: Ocupare 20–64 ani
- X7: Șomaj 20–64 ani
- X8: Șomaj tineri

## 1. (1p) Analizați matricea de corelație pentru datele numerice inițiale. Formulați o concluzie privind aplicarea analizei componentelor principale.

```r
cor(scale(X,center=T,scale=T))
```

```text
    X1      X2      X3      X4      X5      X6      X7      X8
X1  1.000   0.855   0.766   0.783   0.820   0.640   -0.617  -0.587
X2  0.855   1.000   0.632   0.686   0.867   0.504   -0.539  -0.414
X3  0.766   0.632   1.000   0.852   0.533   0.835   -0.815  -0.824
X4  0.783   0.686   0.852   1.000   0.596   0.849   -0.822  -0.797
X5  0.820   0.867   0.533   0.596   1.000   0.395   -0.413  -0.304
X6  0.640   0.504   0.835   0.849   0.395   1.000   -0.846  -0.856
X7  -0.617  -0.539  -0.815  -0.822  -0.413  -0.846  1.000   0.831
X8  -0.587  -0.414  -0.824  -0.797  -0.304  -0.856  0.831   1.000
```

**Pe înțelesul tău:** cor(scale(X)) este matricea de corelație a indicatorilor. Standardizarea nu schimbă corelațiile Pearson între coloane. Ignor diagonala de 1, discut semnul și modulul a două valori și abia apoi justific utilitatea ACP. Nu spun că ACP este interzisă când corelațiile sunt mici.

**Răspuns-model:** X2–X5 au r = 0.867, iar X6–X8 au r = -0.856. Sunt 24 perechi cu |r| ≥ 0,50 din 28. Corelațiile indică informație comună și justifică explorarea prin ACP. Semnul arată sensul asocierii, nu cauzalitatea.

- 0.5p: Citezi două corelații și sensul lor.
- 0.5p: Legi informația comună de utilitatea ACP.

## 2. (2p) Folosiți două criterii pentru a decide numărul de componente păstrate în analiză.

```r
summary(acp)
plot(acp,type="l")
summary(acp2)  # secțiunea Eigenvalues
```

```text
                        Comp.1   Comp.2   Comp.3   Comp.4   Comp.5   Comp.6   Comp.7   Comp.8
Standard deviation      2.420    1.147    0.453    0.396    0.367    0.346    0.338    0.313
Proportion of Variance  0.73206  0.16452  0.02564  0.01955  0.01679  0.01493  0.01429  0.01221
Cumulative Proportion   0.73206  0.89658  0.92223  0.94178  0.95857  0.97350  0.98779  1.00000

Eigenvalues           Dim.1   Dim.2   Dim.3   Dim.4   Dim.5   Dim.6   Dim.7   Dim.8
Variance              5.856   1.316   0.205   0.156   0.134   0.119   0.114   0.098
% of var.             73.206  16.452  2.564   1.955   1.679   1.493   1.429   1.221
Cumulative % of var.  73.206  89.658  92.223  94.178  95.857  97.350  98.779  100.000
```

**Pe înțelesul tău:** Citește trei lucruri separat: Standard deviation = abaterea componentei; pătratul ei = valoarea proprie; Proportion/Cumulative sunt proporții și se înmulțesc cu 100 pentru procente. Scree plot arată valorile proprii; cotul este un reper grafic, nu un număr impus fără justificare. Graficul plot(acp) afișează implicit cel mult primele 10 axe; tabelul este complet. ncp=5 implicit din PCA() nu înlocuiește criteriile de selecție.

**Răspuns-model:** Ridic la pătrat Standard deviation: pentru PC1, 2.420² ≈ 5.856; valorile nerotunjite dau rezultatul exact. Kaiser păstrează 2 componente cu λ > 1, echivalent sdev > 1 în această ACP standardizată. Acestea explică 89.66%. La un prag ales de 80%, primul număr suficient este 2, cu 89.66%. Criteriile coincid. Proportion of Variance pentru PC1 este 0.73206, adică 73.21%.

- 1p: Aplici Kaiser și indici numărul corect.
- 1p: Precizezi pragul și primul număr care îl atinge; justifici alegerea.

![Scree plot al valorilor proprii](model-18-scree.svg)

## 3. (2p) Folosiți matricea factor pentru a interpreta a doua componentă principală.

```r
scoruri <- acp$scores
MF=cor(X,scoruri)
corrplot(MF,method="number")
```

```text
MF  Comp.1  Comp.2  Comp.3  Comp.4  Comp.5  Comp.6  Comp.7  Comp.8
X1  0.882   0.355   0.188   0.018   0.007   0.063   0.057   0.229
X2  0.793   0.537   -0.122  0.059   -0.078  0.122   0.166   -0.129
X3  0.923   -0.158  0.185   0.177   -0.186  -0.101  -0.086  -0.077
X4  0.940   -0.088  -0.022  -0.202  -0.052  0.171   -0.187  -0.030
X5  0.705   0.656   -0.041  -0.041  0.155   -0.179  -0.108  -0.043
X6  0.877   -0.356  -0.019  -0.225  -0.060  -0.154  0.158   0.005
X7  -0.869  0.323   0.320   -0.151  -0.011  0.019   0.041   -0.112
X8  -0.833  0.455   -0.126  -0.072  -0.251  -0.071  -0.055  0.086
```

**Pe înțelesul tău:** Aici matricea factor chiar este cor(X, scoruri), deci numerele sunt corelații. Nu o confunda cu acp$loadings, unde sunt vectorii proprii. Citesc doar Comp.2, aleg coeficienții mari în modul, verific și minusurile și construiesc numele pe indicatorii dominanți. Pentru sensul regiunilor din fviz_pca_ind folosesc coordonatele PCA de la cerința 4: între metode semnul unei axe poate fi inversat.

**Răspuns-model:** Pe Comp.2 sunt asocieri pozitive mai importante pentru PIB pe locuitor (PPS) (X5: 0.656), Internet zilnic (X2: 0.537), Șomaj tineri (X8: 0.455) și negative pentru Ocupare 20–64 ani (X6: -0.356). Componenta explică 16.45% din variația totală. O denumire descriptivă posibilă este „contrast între PIB pe locuitor (PPS) / Internet zilnic / Șomaj tineri”, cu sensurile precizate mai sus.  Numele descrie asocieri din setul de date; nu demonstrează cauzalitate.

- 1p: Identifici indicatorii dominanți și coeficienții lor pe PC2.
- 1p: Explici sensurile, propui un nume susținut și precizezi variația explicată.

![Matricea factor cu valori numerice](model-18-factor.svg)

## 4. (2p) Din outputul numeric privind variabilele interpretați coloanele Dim1, Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.

```r
acp2 <- PCA(X,scale.unit=T,graph=T)
summary(acp2)  # secțiunea Variables
```

```text
Variables
    Dim.1   ctr     cos2   Dim.2   ctr     cos2   Dim.3   ctr     cos2
X1  0.882   13.296  0.779  0.355   9.581   0.126  0.188   17.269  0.035
X2  0.793   10.727  0.628  0.537   21.927  0.289  -0.122  7.212   0.015
X3  0.923   14.536  0.851  -0.158  1.904   0.025  0.185   16.669  0.034
X4  0.940   15.079  0.883  -0.088  0.593   0.008  -0.022  0.232   0.000
X5  0.705   8.482   0.497  0.656   32.682  0.430  -0.041  0.838   0.002
X6  0.877   13.135  0.769  -0.356  9.655   0.127  -0.019  0.181   0.000
X7  -0.869  12.907  0.756  0.323   7.918   0.104  0.320   49.917  0.102
X8  -0.833  11.839  0.693  0.455   15.740  0.207  -0.126  7.683   0.016
```

**Pe înțelesul tău:** În fiecare grup de trei coloane citești: Dim = corelație, ctr = procent din construirea componentei, cos2 = cât de bine se vede variabila pe acea axă. Următorul grup este pentru componenta următoare. Nu aduni ctr de pe PC1 cu ctr de pe PC2 și nu tratezi ctr ca procent de reprezentare. Summary afișează implicit doar 10 elemente și 3 axe, deși analiza poate conține mai multe.

**Răspuns-model:** În Variables, Dim.1 și Dim.2 sunt corelații. Pentru X4, r cu PC1 este 0.940, iar cu PC2 este -0.088; semnul indică sensul, modulul intensitatea. ctr este contribuția la construirea axei: X4 are 15.08% pe PC1 și X5 are 32.68% pe PC2. Reperul mediu este 100/8 = 12.50%, calculat cu toate cele 8 variabile active. cos² pentru X4 pe PC1 este 0.883, adică 88.31% din variația sa reprezentată de această axă; în această ACP standardizată cos² = r². Contribuțiile tuturor variabilelor însumează 100% separat pe fiecare axă, înainte de rotunjire. Primele două axe au aceeași orientare în cele două outputuri din această variantă.

- 1p: Interpretezi numeric Dim1 și Dim2, cu semn și intensitate.
- 1p: Interpretezi contribuțiile pentru ambele axe, reperul mediu și diferența față de cos².

## 5. (2p) Reprezentați grafic regiunile într-un spațiu definit de primele două componente principale. Extrageți 2 concluzii.

```r
fviz_pca_ind(acp2)
# Tabelul de mai jos selectează extremele din acp2$ind; nu este lista implicită a primelor 10.
```

```text
Individuals — selecție pentru verificarea concluziilor
         Dist   Dim.1   ctr    cos2   Dim.2   ctr    cos2
T18R059  5.003  4.975   4.594  0.989  -0.006  0.000  0.000
T18R038  6.633  -6.564  7.998  0.979  0.200   0.033  0.001
T18R052  3.758  2.194   0.893  0.341  3.008   7.473  0.641
T18R023  3.694  -2.403  1.071  0.423  -2.754  6.263  0.556
```

**Pe înțelesul tău:** În Individuals, Dim este scorul unei regiuni, nu corelația unei variabile. Poate depăși ±1. ctr arată participarea regiunii la axă; cos² arată calitatea reprezentării, iar cos² pe plan = cos² pe PC1 + cos² pe PC2. Folosesc indicatorii din PCA pentru a numi direcțiile graficului. Două puncte apropiate sugerează profiluri asemănătoare în plan, fără a demonstra identitate în toate variabilele.

**Răspuns-model:** Graficul regiunilor folosește coordonatele din PCA, cu PC1 orizontală și PC2 verticală, și păstrează 89.66% din variație. Concluzia 1: T18R059 (PC1=4.975) și T18R038 (PC1=-6.564) au profiluri opuse pe PC1. Sensul pozitiv este asociat cu Cumpărături online (X4: 0.940), Internet banking (X3: 0.923), Internet acasă (X1: 0.882), iar cel negativ cu Șomaj 20–64 ani (X7: -0.869), Șomaj tineri (X8: -0.833). Concluzia 2: T18R052 (PC2=3.008) și T18R023 (PC2=-2.754) contrastează pe PC2, al cărei sens pozitiv este asociat cu PIB pe locuitor (PPS) (X5: 0.656), Internet zilnic (X2: 0.537), Șomaj tineri (X8: 0.455), iar cel negativ cu Ocupare 20–64 ani (X6: -0.356). cos² în plan pentru aceste ultime două regiuni este 0.981, respectiv 0.979; țin cont de calitatea reprezentării.

- 0.5p: Reprezinți regiunile pe cele două axe etichetate și menționezi informația păstrată.
- 0.75p: Formulezi prima concluzie concretă, legată de PC1.
- 0.75p: Formulezi a doua concluzie concretă, legată de PC2; respecți limitele planului.

![Regiuni](model-18.svg)

Surse tehnice: [R princomp](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/princomp.html), [summary.PCA](https://github.com/cran/FactoMineR/blob/master/R/summary.PCA.r), [svd.triplet](https://github.com/cran/FactoMineR/blob/master/R/svd.triplet.R).
