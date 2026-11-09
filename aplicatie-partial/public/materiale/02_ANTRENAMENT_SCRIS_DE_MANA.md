# Pregătirea pentru testul scris de mână

## Ce schimbă mesajul profesorului

Vei vedea outputul pe computer, dar vei scrie interpretarea de mână. Prioritatea este să poți formula singur două-patru propoziții, cu o valoare concretă și sensul ei.

Profesorul numește explicit: matricea de corelație, Kaiser, matricea factor, interpretarea componentelor și reprezentarea grafică. „Cam tot ce am făcut” înseamnă că nu este prudent să ignori summary, scoruri, cos², contribuții și descriptive.

Seminarul 7 primit luni adaugă analiza corespondențelor. Îl pregătim și pe acesta; mesajul nu enumeră însă exact ce itemi va conține testul. Nu avem un barem oficial sau o durată confirmată.

## Cum procedezi la fiecare output

1. Scrii ce reprezintă tabelul sau graficul.
2. Alegi una-două valori relevante, cu semnul lor.
3. Spui ce înseamnă în context.
4. Dacă este un grafic ACP, precizezi planul și câtă variație explică.

Ținta este un răspuns scurt și complet, fără o pagină de definiții.

## Cinci începuturi de răspuns de memorat

| Dacă primești… | Începi astfel |
|---|---|
| Corelații | „Între … și … există asociere liniară …, cu r=….” |
| Lambda / Kaiser | „… valori proprii depășesc 1, deci Kaiser recomandă … axe.” |
| Matrice factor | „Componenta se corelează pozitiv cu … și negativ cu …; descrie ….” |
| Grafic ACP | „Planul … explică …%; poziția / direcția … indică ….” |
| Analiza corespondențelor | „Categoriile … sunt asociate; interpretarea este susținută de ….” |

## Simulare A — materia ACP, pe hârtie

Durată propusă: 35 de minute. Barem de antrenament: 1 punct din oficiu și 9 puncte pentru cele patru cerințe. Nu este baremul profesorului.

Copiază numai răspunsurile tale pe o foaie. Citește baremul abia la final.

### 1. Corelații — 2 puncte

```text
Internet zilnic – PIB:           0.585
Ocupare – somaj:                -0.739
```

Scrie câte o propoziție de interpretare pentru fiecare pereche și o limită a concluziilor.

### 2. Alegerea componentelor — 2 puncte

Analiză pe corelații:

```text
           PC1     PC2     PC3     PC4
lambda     6.714   1.727   1.096   0.670
cumulat%  55.95   70.34   79.47   85.06
```

Câte axe recomandă Kaiser? Câte alegi pentru minimum 80%? Justifică ambele răspunsuri.

### 3. Interpretarea componentelor — 3 puncte

```text
Matrice factor                 PC1       PC2
Cumparaturi online             0.901    -0.025
Ocupare                        0.856    -0.378
Somaj                         -0.591     0.694
Studii superioare              0.717     0.490
NEET                          -0.907     0.105
```

Denumește sau descrie fiecare axă. Explică de ce un scor pozitiv pe PC2 nu este obligatoriu favorabil.

### 4. Regiune și reprezentare — 2 puncte

```text
BE10: PC1=0.878 | PC2=6.169
cos2 plan PC1-PC2=0.479 | cos2 primele 4=0.909
```

Explică scorul PC2 și cele două valori cos². Poate fi reprezentată incomplet în primul plan, chiar dacă se distinge pe PC2?

## Baremul simulării A

**1 — model:** „Internetul zilnic și PIB-ul au asociere liniară pozitivă, r=0,585. Ocuparea și șomajul au asociere negativă, r=−0,739: ocuparea mai mare tinde să coexiste cu șomaj mai mic. Aceste asocieri nu demonstrează cauzalitate.” Acordă 0,75p pentru fiecare relație și 0,50p pentru limită.

**2 — model:** „Kaiser recomandă trei axe, deoarece primele trei lambda depășesc 1. Pentru minimum 80% aleg patru, deoarece trei explică 79,47%, iar patru 85,06%.” Acordă câte 1p pentru fiecare alegere justificată.

**3 — model:** „PC1 opune digitalizarea, ocuparea și studiile superioare șomajului și NEET și descrie integrarea digitală, economică și socială. PC2 opune mai ales șomajul și studiile superioare ocupării și descrie un profil mixt. De aceea, pozitiv pe PC2 nu înseamnă automat favorabil.” Acordă 1,5p pentru PC1, 1p pentru PC2 și 0,5p pentru precizarea sensului pozitiv.

**4 — model:** „BE10 are scor ridicat pozitiv pe PC2; acesta este o coordonată, fără limita ±1 a corelațiilor. Primul plan surprinde numai 47,9% din distanța sa pătratică față de centru, iar primele patru axe surprind 90,9%. Există informație importantă pe axele suplimentare.” Acordă 0,5p pentru scor, 1p pentru cele două cos² și 0,5p pentru concluzie.

## Simulare B — seminarul 7, cinci răspunsuri scurte

Folosește [fișa cu outputul original](01_SEMINAR7_EXPLICAT_SIMPLU.md). Scrie pe hârtie:

1. Ce înseamnă frecvența observată 37 și de ce este diferită de valoarea așteptată 19,45?
2. Ce procent din inerție preia prima axă? Dar primele două?
3. Cum traduci `cor=765`, `ctr=338` și `inr=334` pentru Acc_M?
4. Ce categorie de pe linii și ce categorie de pe coloane contribuie cel mai mult la inerția totală?
5. Ce asocieri între categorii observi și ce verifici în tabel pentru a le susține?

### Răspunsurile-model B

1. „37 de observații aparțin simultan Acc_Mij și Ban_Mij, față de circa 19,45 așteptate la independență. Combinația este supra-reprezentată.”
2. „Prima axă explică 75,5%, iar primele două împreună 100% din inerția totală.”
3. „Acc_M este reprezentată în proporție de 76,5% pe axa 1 și contribuie cu 33,8% la această axă. Categoria aduce 33,4% la inerția totală.”
4. „Acc_P, cu aproximativ 48,2%, și Ban_P, cu aproximativ 49,0%, în grupurile lor de categorii.”
5. „Acc_M–Ban_M, Acc_Mij–Ban_Mij și Acc_P–Ban_P; celulele corespunzătoare apar mai des decât ar rezulta la independență.”

## Ultima verificare înainte să predai

- Am scris **ce obiect** interpretez: indicator, regiune sau categorie?
- Am citat **o valoare** și am explicat sensul ei?
- Am separat **corelație, scor, cos² și contribuție**?
- Am citit axele și legenda graficului primit?
- La `ca()`, am verificat **scalarea cu 1000** și diferența inr/ctr?
- Am evitat să numesc automat „favorabil” un scor pozitiv?

Pentru a exersa eficient, scrie răspunsul fără fișă, apoi compară-l cu modelul. Corectează propoziția greșită și scrie-o din nou din memorie.
