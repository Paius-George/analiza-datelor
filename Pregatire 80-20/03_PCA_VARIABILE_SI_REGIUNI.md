# 3. Variables și Individuals — diferența care aduce puncte

## Variables: Dim, ctr, cos2

**Exemplu real rotunjit, ACP standardizată:**

```text
Variables
       Dim.1   ctr    cos2
X1     0.719   7.69   0.516
```

**Spui:** „X1 se corelează pozitiv cu PC1, cu aproximativ 0,719. PC1 reprezintă 51,6% din variația lui X1. X1 contribuie cu 7,69% la construirea PC1.”

| Coloană | Întrebarea la care răspunde |
|---|---|
| Dim | În ce sens și cât de puternic este legată variabila de axă? |
| cos2 | Cât din variația acestei variabile este reprezentată pe axă? |
| ctr | Cât participă variabila la varianța axei? |

Nu spune „X1 explică 51,6% din PC1”: aceasta ar fi o interpretare greșită a cos².

## Calitatea într-un plan și în primele patru axe

**Vezi pentru densitate, X12:**

```text
cos2 PC1: 0.034    cos2 PC2: 0.266
cos2 plan 1-2: 0.300    cos2 primele 4: 0.816
```

**Spui:** „Primele două axe surprind circa 30% din variația densității; primele patru surprind 81,6%. Variabila se descrie mai bine dacă includem axele suplimentare.”

Cos² pe un plan se obține adunând valorile axelor sale. O reprezentare slabă într-un plan nu înseamnă că variabila este inutilă.

## Contribuții pe o axă

**Vezi pentru PC2:**

```text
Somaj general 27.91%    Somaj tineri 17.28%    Densitate 15.38%
```

**Spui:** „Acești indicatori au cele mai mari contribuții dintre cei prezentați la construirea PC2. Șomajul general are aportul cel mai mare.”

Pentru 12 variabile, contribuția egală ar fi 8,33% pe axă. Este o referință descriptivă, nu un test statistic. Contribuția nu arată sensul; pentru sens citești Dim.

## Individuals: Dist, Dim, ctr, cos2

**Fragment real rotunjit:**

```text
BE10
Dist 9.006    Dim.2 6.169    ctr PC2 19.00%    cos2 PC2 0.469
```

**Spui:** „BE10 este departe de centrul datelor și are scor pozitiv ridicat pe PC2. Contribuie cu aproximativ 19% la construirea PC2, iar această axă surprinde 46,9% din distanța sa pătratică totală față de centru.”

Dist este distanța în spațiul complet; Dim este scorul pe o singură axă. Cos² mare înseamnă reprezentare bună, fără să însemne automat performanță bună.

## Calitatea unei regiuni în plan

**Vezi pentru BE10:**

```text
cos2 plan PC1-PC2: 0.479    cos2 primele 4: 0.909
```

**Spui:** „Primul plan descrie circa 47,9% din distanța pătratică a regiunii față de centru. Primele patru axe o descriu mult mai bine, în proporție de 90,9%.”

O regiune poate fi distinctă pe PC2 și totuși să aibă informație importantă pe alte axe.

## Sumele din output

**Exemplu de verificare:**

```text
Suma ctr pe PC1: 100%
Suma cos2 pe toate axele pentru X1: 1
```

**Spui:** „Contribuțiile tuturor variabilelor pe o axă însumează 100%. Pentru aceeași variabilă, toate axele împreună descriu întreaga variație.”

La observații, contribuțiile tuturor observațiilor pe o axă însumează tot 100%, iar cos² unei observații pe toate axele însumează 1 dacă distanța față de centru este nenulă. Pentru 116 observații egale, contribuția egală este circa 0,862% pe axă.

[Înapoi la început](00_INCEPE_AICI.md) · [Urmează: grafice](04_GRAFICE_INTERPRETATE.md)
