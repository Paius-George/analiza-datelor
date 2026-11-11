# Model 20 — Simulare completă cu codul profesorului

Variantă nouă după cerințele din fotografie și comenzile din „Cod test ACP.docx”. Date sintetice; outputuri didactice calculate în Python după definițiile funcțiilor, fără rulare R.

40 minute · 9p + 1p din oficiu. Barem orientativ.

**Capcana de urmărit:** Încheie fiecare răspuns cu o concluzie și citează valori. Separă ce descriu variabilele de ce descriu regiunile.

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
X1   1.000   0.859   0.797   0.798   0.824   0.598   -0.686  -0.599  0.600   0.589   -0.705  0.281
X2   0.859   1.000   0.613   0.676   0.845   0.400   -0.517  -0.423  0.712   0.690   -0.651  0.271
X3   0.797   0.613   1.000   0.938   0.488   0.892   -0.936  -0.893  0.127   0.460   -0.792  -0.101
X4   0.798   0.676   0.938   1.000   0.532   0.883   -0.913  -0.862  0.183   0.485   -0.785  -0.043
X5   0.824   0.845   0.488   0.532   1.000   0.262   -0.352  -0.231  0.848   0.465   -0.413  0.582
X6   0.598   0.400   0.892   0.883   0.262   1.000   -0.919  -0.917  -0.130  0.279   -0.688  -0.216
X7   -0.686  -0.517  -0.936  -0.913  -0.352  -0.919  1.000   0.938   0.032   -0.456  0.820   0.284
X8   -0.599  -0.423  -0.893  -0.862  -0.231  -0.917  0.938   1.000   0.129   -0.460  0.827   0.374
X9   0.600   0.712   0.127   0.183   0.848   -0.130  0.032   0.129   1.000   0.408   -0.164  0.667
X10  0.589   0.690   0.460   0.485   0.465   0.279   -0.456  -0.460  0.408   1.000   -0.791  -0.278
X11  -0.705  -0.651  -0.792  -0.785  -0.413  -0.688  0.820   0.827   -0.164  -0.791  1.000   0.359
X12  0.281   0.271   -0.101  -0.043  0.582   -0.216  0.284   0.374   0.667   -0.278  0.359   1.000
```

**Pe înțelesul tău:** cor(scale(X)) este matricea de corelație a indicatorilor. Standardizarea nu schimbă corelațiile Pearson între coloane. Ignor diagonala de 1, discut semnul și modulul a două valori și abia apoi justific utilitatea ACP. Nu spun că ACP este interzisă când corelațiile sunt mici.

**Răspuns-model:** X7–X8 au r = 0.938, iar X3–X4 au r = 0.938. Sunt 37 perechi cu |r| ≥ 0,50 din 66. Corelațiile indică informație comună și justifică explorarea prin ACP. Semnul arată sensul asocierii, nu cauzalitatea.

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
Standard deviation      2.683    1.735    1.071    0.363    0.310    0.302    0.277    0.259    0.250    0.217    0.197    0.184
Proportion of Variance  0.59990  0.25084  0.09554  0.01095  0.00803  0.00761  0.00638  0.00557  0.00520  0.00394  0.00323  0.00281
Cumulative Proportion   0.59990  0.85074  0.94628  0.95723  0.96526  0.97287  0.97925  0.98482  0.99002  0.99396  0.99719  1.00000

Eigenvalues           Dim.1   Dim.2   Dim.3   Dim.4   Dim.5   Dim.6   Dim.7   Dim.8   Dim.9   Dim.10  Dim.11  Dim.12
Variance              7.199   3.010   1.147   0.131   0.096   0.091   0.077   0.067   0.062   0.047   0.039   0.034
% of var.             59.990  25.084  9.554   1.095   0.803   0.761   0.638   0.557   0.520   0.394   0.323   0.281
Cumulative % of var.  59.990  85.074  94.628  95.723  96.526  97.287  97.925  98.482  99.002  99.396  99.719  100.000
```

**Pe înțelesul tău:** Citește trei lucruri separat: Standard deviation = abaterea componentei; pătratul ei = valoarea proprie; Proportion/Cumulative sunt proporții și se înmulțesc cu 100 pentru procente. Scree plot arată valorile proprii; cotul este un reper grafic, nu un număr impus fără justificare. Graficul plot(acp) afișează implicit cel mult primele 10 axe; tabelul este complet. ncp=5 implicit din PCA() nu înlocuiește criteriile de selecție.

**Răspuns-model:** Ridic la pătrat Standard deviation: pentru PC1, 2.683² ≈ 7.199; valorile nerotunjite dau rezultatul exact. Kaiser păstrează 3 componente cu λ > 1, echivalent sdev > 1 în această ACP standardizată. Acestea explică 94.63%. La un prag ales de 80%, primul număr suficient este 2, cu 85.07%. Dacă vreau minimum 80% din informație, aleg 2; aplicând strict Kaiser, aleg 3. Proportion of Variance pentru PC1 este 0.59990, adică 59.99%.

- 1p: Aplici Kaiser și indici numărul corect.
- 1p: Precizezi pragul și primul număr care îl atinge; justifici alegerea.

![Scree plot al valorilor proprii](model-20-scree.svg)

## 3. (2p) Folosiți matricea factor pentru a interpreta a doua componentă principală.

```r
scoruri <- acp$scores
MF=cor(X,scoruri)
corrplot(MF,method="number")
```

```text
MF   Comp.1  Comp.2  Comp.3  Comp.4  Comp.5  Comp.6  Comp.7  Comp.8  Comp.9  Comp.10  Comp.11  Comp.12
X1   0.896   0.352   0.070   0.092   0.181   0.105   0.042   0.020   0.083   0.056    0.049    0.040
X2   0.799   0.493   -0.168  -0.273  0.031   0.024   -0.083  -0.006  0.065   -0.052   0.001    -0.016
X3   0.936   -0.183  0.210   0.035   0.107   0.007   0.061   -0.063  -0.057  -0.096   -0.114   -0.020
X4   0.943   -0.118  0.201   -0.114  -0.065  0.065   0.031   -0.029  -0.149  0.062    0.029    0.075
X5   0.651   0.716   0.070   0.026   -0.006  -0.188  0.021   0.138   -0.024  -0.007   -0.022   0.046
X6   0.818   -0.412  0.335   -0.035  -0.126  -0.003  0.057   0.018   0.130   0.079    -0.065   -0.025
X7   -0.901  0.358   -0.142  -0.000  -0.051  0.108   0.003   0.013   0.042   -0.024   -0.095   0.115
X8   -0.853  0.464   -0.088  -0.095  0.097   0.008   0.047   0.019   -0.060  0.122    -0.072   -0.062
X9   0.337   0.905   -0.122  0.076   -0.068  -0.068  0.004   -0.187  0.020   0.034    -0.001   0.001
X10  0.671   0.114   -0.707  0.031   -0.084  0.073   0.137   0.052   -0.019  -0.026   0.010    -0.041
X11  -0.889  0.197   0.333   -0.111  0.010   -0.033  0.192   -0.030  0.036   -0.056   0.058    0.011
X12  -0.052  0.835   0.509   0.066   -0.086  0.132   -0.037  0.055   -0.034  -0.038   0.011    -0.065
```

**Pe înțelesul tău:** Aici matricea factor chiar este cor(X, scoruri), deci numerele sunt corelații. Nu o confunda cu acp$loadings, unde sunt vectorii proprii. Citesc doar Comp.2, aleg coeficienții mari în modul, verific și minusurile și construiesc numele pe indicatorii dominanți. Pentru sensul regiunilor din fviz_pca_ind folosesc coordonatele PCA de la cerința 4: între metode semnul unei axe poate fi inversat.

**Răspuns-model:** Pe Comp.2 sunt asocieri pozitive mai importante pentru Studii superioare (X9: 0.905), Densitatea populației (X12: 0.835), PIB pe locuitor (PPS) (X5: 0.716) și negative pentru Ocupare 20–64 ani (X6: -0.412). Componenta explică 25.08% din variația totală. O denumire descriptivă posibilă este „contrast între Studii superioare / Densitatea populației / PIB pe locuitor (PPS)”, cu sensurile precizate mai sus.  Numele descrie asocieri din setul de date; nu demonstrează cauzalitate.

- 1p: Identifici indicatorii dominanți și coeficienții lor pe PC2.
- 1p: Explici sensurile, propui un nume susținut și precizezi variația explicată.

![Matricea factor cu valori numerice](model-20-factor.svg)

## 4. (2p) Din outputul numeric privind variabilele interpretați coloanele Dim1, Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.

```r
acp2 <- PCA(X,scale.unit=T,graph=T)
summary(acp2)  # secțiunea Variables
```

```text
Variables (the 10 first)
     Dim.1   ctr     cos2   Dim.2   ctr     cos2   Dim.3   ctr     cos2
X1   0.896   11.143  0.802  0.352   4.128   0.124  0.070   0.428   0.005
X2   0.799   8.874   0.639  0.493   8.074   0.243  -0.168  2.454   0.028
X3   0.936   12.173  0.876  -0.183  1.117   0.034  0.210   3.829   0.044
X4   0.943   12.366  0.890  -0.118  0.463   0.014  0.201   3.517   0.040
X5   0.651   5.893   0.424  0.716   17.017  0.512  0.070   0.428   0.005
X6   0.818   9.298   0.669  -0.412  5.635   0.170  0.335   9.797   0.112
X7   -0.901  11.283  0.812  0.358   4.261   0.128  -0.142  1.766   0.020
X8   -0.853  10.114  0.728  0.464   7.165   0.216  -0.088  0.678   0.008
X9   0.337   1.578   0.114  0.905   27.237  0.820  -0.122  1.295   0.015
X10  0.671   6.250   0.450  0.114   0.429   0.013  -0.707  43.568  0.500
```

**Pe înțelesul tău:** În fiecare grup de trei coloane citești: Dim = corelație, ctr = procent din construirea componentei, cos2 = cât de bine se vede variabila pe acea axă. Următorul grup este pentru componenta următoare. Nu aduni ctr de pe PC1 cu ctr de pe PC2 și nu tratezi ctr ca procent de reprezentare. Summary afișează implicit doar 10 elemente și 3 axe, deși analiza poate conține mai multe.

**Răspuns-model:** În Variables, Dim.1 și Dim.2 sunt corelații. Pentru X4, r cu PC1 este 0.943, iar cu PC2 este -0.118; semnul indică sensul, modulul intensitatea. ctr este contribuția la construirea axei: X4 are 12.37% pe PC1 și X9 are 27.24% pe PC2. Reperul mediu este 100/12 = 8.33%, calculat cu toate cele 12 variabile active. cos² pentru X4 pe PC1 este 0.890, adică 89.02% din variația sa reprezentată de această axă; în această ACP standardizată cos² = r². Tabelul arată doar primele 10 variabile, deci contribuțiile rândurilor vizibile nu trebuie să însumeze 100%. Primele două axe au aceeași orientare în cele două outputuri din această variantă.

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
T20R088  8.135  8.095   9.102  0.990  -0.101  0.003  0.000
T20R091  6.646  -6.507  5.881  0.959  -0.507  0.086  0.006
T20R067  5.835  4.185   2.433  0.515  3.984   5.274  0.466
T20R004  5.020  -1.659  0.382  0.109  -4.471  6.642  0.793
```

**Pe înțelesul tău:** În Individuals, Dim este scorul unei regiuni, nu corelația unei variabile. Poate depăși ±1. ctr arată participarea regiunii la axă; cos² arată calitatea reprezentării, iar cos² pe plan = cos² pe PC1 + cos² pe PC2. Folosesc indicatorii din PCA pentru a numi direcțiile graficului. Două puncte apropiate sugerează profiluri asemănătoare în plan, fără a demonstra identitate în toate variabilele.

**Răspuns-model:** Graficul regiunilor folosește coordonatele din PCA, cu PC1 orizontală și PC2 verticală, și păstrează 85.07% din variație. Concluzia 1: T20R088 (PC1=8.095) și T20R091 (PC1=-6.507) au profiluri opuse pe PC1. Sensul pozitiv este asociat cu Cumpărături online (X4: 0.943), Internet banking (X3: 0.936), Internet acasă (X1: 0.896), iar cel negativ cu Șomaj 20–64 ani (X7: -0.901), NEET (X11: -0.889), Șomaj tineri (X8: -0.853). Concluzia 2: T20R067 (PC2=3.984) și T20R004 (PC2=-4.471) contrastează pe PC2, al cărei sens pozitiv este asociat cu Studii superioare (X9: 0.905), Densitatea populației (X12: 0.835), PIB pe locuitor (PPS) (X5: 0.716), iar cel negativ cu Ocupare 20–64 ani (X6: -0.412). cos² în plan pentru aceste ultime două regiuni este 0.981, respectiv 0.903; țin cont de calitatea reprezentării.

- 0.5p: Reprezinți regiunile pe cele două axe etichetate și menționezi informația păstrată.
- 0.75p: Formulezi prima concluzie concretă, legată de PC1.
- 0.75p: Formulezi a doua concluzie concretă, legată de PC2; respecți limitele planului.

![Regiuni](model-20.svg)

Surse tehnice: [R princomp](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/princomp.html), [summary.PCA](https://github.com/cran/FactoMineR/blob/master/R/summary.PCA.r), [svd.triplet](https://github.com/cran/FactoMineR/blob/master/R/svd.triplet.R).
