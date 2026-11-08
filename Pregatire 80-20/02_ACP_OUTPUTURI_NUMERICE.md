# 2. ACP — citești numerele fără să le confunzi

**Ideea de bază:** componentele sunt rezumate ale indicatorilor. Vrei să afli cât păstrează fiecare rezumat și ce descrie.

## 1. summary — cât păstrează fiecare rezumat?

**Ce vezi, rotunjit:**

```text
                         PC1     PC2     PC3     PC4
Standard deviation      2.5911  1.3140  1.0468  0.8188
Proportion of Variance  0.5595  0.1439  0.0913  0.0559
Cumulative Proportion   0.5595  0.7034  0.7947  0.8506
```

Citești astfel:

| Rând | Traducere simplă | Exemplu |
|---|---|---|
| Standard deviation | Abaterea standard a componentei | PC1 are SD≈2,591 |
| Proportion of Variance | Cât explică doar această componentă | PC2 explică 14,39% |
| Cumulative Proportion | Cât explică toate componentele până aici | PC1+PC2 explică 70,34% |

**La test poți spune:** „Prima componentă explică 55,95% din variația totală. Primele două explică împreună 70,34%, iar primele patru 85,06%.”

**Reține:** Proportion = una singură; Cumulative = toate până aici. 0,5595 înseamnă 55,95%, nu 0,5595%.

## 2. Lambda — câtă variație are componenta?

**Ce vezi:**

```text
       lambda    procent    cumulat
PC1     6.714     55.95      55.95
PC2     1.727     14.39      70.34
PC3     1.096      9.13      79.47
PC4     0.670      5.59      85.06
```

**Cum înțelegi:** lambda este varianța componentei, adică mărimea variației pe care o preia. PC1 are cea mai mare valoare, apoi valorile scad.

**La test poți spune:** „PC1 preia cea mai mare variație, având lambda≈6,714. Aceasta reprezintă 55,95% din total.”

**Legătura cu SD:** 2,591 × 2,591 ≈ 6,714. Aceeași informație este afișată în două forme: SD și varianță.

La ACP pe corelații, 12 variabile înseamnă un total lambda de 12. La ACP pe covarianțe, totalul este suma varianțelor originale și poate fi diferit de 12.

## 3. Câte componente păstrezi?

Ai două reguli pe care trebuie să le citești separat:

- **Kaiser:** numeri valorile lambda mai mari decât 1. Aici sunt trei.
- **Prag de variație:** mergi pe Cumulative până atingi procentul cerut. Pentru 80%, primele trei au numai 79,47%; ai nevoie de a patra.

**La test poți spune:** „Kaiser recomandă trei componente, dar pentru pragul de 80% păstrez patru, care explică 85,06%.”

**Dacă vezi TRUE TRUE TRUE FALSE…**, aceleași trei axe au trecut regula lambda>1. Dacă se cer minimum 75%, aici ajung trei axe. Citești pragul primit; 80% nu este o regulă obligatorie pentru orice analiză.

Kaiser cu pragul 1 se folosește în acest context standardizat; nu îl transferi automat la covarianțe pe unități diferite.

## 4. Loadings și vectori proprii — rețeta componentei

**Ce vezi pentru PC1:**

```text
Ocupare      0.3303
Somaj       -0.2281
NEET        -0.3500
```

**Cum înțelegi:** componenta este un amestec de indicatori. Coeficienții arată cum intră aceștia în amestec: ocuparea cu plus, șomajul și NEET cu minus.

**La test poți spune:** „PC1 combină pozitiv ocuparea și negativ șomajul și NEET.”

**Reține:** loading = coeficient din rețetă. 0,3303 nu înseamnă automat corelație 0,3303 sau contribuție 33,03%. Spațiile goale din tabel pot ascunde coeficienți mici, fără să fie exact zero.

Dacă toate semnele unei coloane sunt inversate, axa este orientată opus. Rezultatul rămâne echivalent dacă se inversează și scorurile acelei axe.

## 5. SS loadings și crossprod(V) — verificări ale rețetei

**Exemplu de afișare:**

```text
SS loadings      1.000  1.000
Proportion Var   0.083  0.083
```

**Cum înțelegi:** acești coeficienți sunt construiți astfel încât suma pătratelor pe fiecare coloană să fie 1. Asta se numește „normă unitară”.

**La test poți spune:** „Coloanele coeficienților au normă unu. Procentele variației explicate se citesc în summary sau în tabelul lambda.”

Nu confunda rândul Proportion Var de aici cu Proportion of Variance din summary.

**Dacă crossprod(V) are 1 pe diagonală și 0 în rest**, spui: „Vectorii proprii sunt unitari și ortogonali.” Simplu: au lungime 1 și direcții perpendiculare. Nu înseamnă că indicatorii inițiali sunt necorelați.

## 6. Matricea factor — ce descrie componenta?

**Ce vezi pentru PC1:**

```text
Cumparaturi online   0.901
Ocupare              0.856
Somaj               -0.591
NEET                -0.907
```

**Cum înțelegi:** acestea sunt legături între indicatori și componentă. Când scorul PC1 este mai mare, profilul tinde să aibă mai multe cumpărături online, ocupare mai mare, șomaj și NEET mai reduse.

**La test poți spune:** „PC1 descrie participarea digitală și integrarea pe piața muncii, în opoziție cu șomajul și NEET.”

**Reține:** denumești axa după indicatorii puternic legați de ea. Dacă nu știi ce înseamnă X1, descrii „X1 și X2 se opun lui X3”, fără o denumire economică inventată.

Pentru ocupare, loading≈0,3303 și corelație≈0,856 sunt valori diferite. Legătura este: coeficientul se înmulțește cu SD a componentei, aici circa 2,591.

**Alt exemplu, PC2:**

```text
Somaj +0.694    Studii superioare +0.490    Ocupare -0.378
```

**La test poți spune:** „PC2 descrie un profil mixt: șomajul și studiile superioare sunt în același sens, opus ocupării. Scorul pozitiv nu înseamnă automat situație mai bună.”

## 7. Scores — unde se află regiunea?

**Ce vezi:**

```text
          PC1      PC2
RO11    -2.754   -1.241
BE10     0.878    6.169
```

**Cum înțelegi:** scorul este locul regiunii pe componentă. Zero este centrul pe acea axă. Plus și minus spun în ce parte se află regiunea.

**La test poți spune:** „RO11 are PC1 negativ. Pe axa care descrie participarea digitală și integrarea, se află sub centrul eșantionului. BE10 are scor pozitiv ridicat pe PC2.”

**Reține:** scorul este o poziție, deci poate fi 6,169. Nu este corelație. Scor negativ nu înseamnă PIB sau șomaj negativ.

| Tabel | Rânduri | Coloane în proiect |
|---|---|---|
| Scoruri | 116 regiuni | 12 axe sau cele 4 păstrate |
| Matrice factor | 12 indicatori | 12 axe sau cele 4 păstrate |

Dacă vezi doar primele cinci rânduri, restul pot exista în obiect, dar nu sunt afișate.

## 8. Mediile și corelațiile scorurilor

**Exemplu:**

```text
          PC1 PC2
PC1        1   0
PC2        0   1
Medii:     0   0
```

**Cum înțelegi:** fiecare axă are centrul la zero. Între axele diferite nu există corelație liniară.

**La test poți spune:** „Componentele sunt centrate și necorelate între ele.”

Dacă ți se cere independența, răspunsul este că necorelarea singură nu o demonstrează. Independența este o condiție mai puternică.

## 9. Scoruri manuale, reconstrucție și erori mici

**Exemple de control:**

```text
AT12, PC1: manual 0.589    princomp 0.592
Dupa corectie: diferenta maxima 4e-14
Eroare reconstructie: 2e-14
```

**Cum înțelegi:** standardizarea manuală și princomp folosesc inițial convenții ușor diferite, n−1 și n. După corecția de scară, rezultatele practic coincid. e−14 înseamnă un număr extrem de mic.

**La test poți spune:** „Diferența inițială provine din convenția de standardizare. După corecție, scorurile coincid la precizia numerică. Cu toate componentele se reconstruiesc datele standardizate.”

Dacă vezi varianțele scorurilor egale cu lambda, spui: „Varianțele componentelor sunt valorile proprii.” În script, se folosește aceeași convenție a divizorului la comparație.

Dacă suma lambda este 12, toate cele 12 axe păstrează întreaga variație. Dacă produsul lambda este egal cu determinantul matricei analizate, este verificată și păstrarea varianței generalizate. Nu este o concluzie despre economie, ci despre calcul.

## 10. princomp versus PCA

**Exemplu de control:**

```text
Diferente maxime: lambda 1e-14, scoruri 4e-14, matrice factor 7e-15
```

**La test poți spune:** „Cele două funcții dau rezultate echivalente la precizia numerică, pe aceleași date și după alinierea semnelor.”

Compari scoruri cu `ind$coord` și matrice factor cu `var$coord` în ACP standardizată. O corelație −1 între scorurile aceleiași axe poate însemna doar că una este orientată invers.

**ncp=12** spune că obiectul păstrează coordonate pentru 12 axe. Nu spune că trebuie să le interpretezi pe toate; numărul ales se justifică din variația cumulată și criteriile cerute.

[Înapoi](00_INCEPE_AICI.md) · [Urmează: cos² și contribuții](03_PCA_VARIABILE_SI_REGIUNI.md)
