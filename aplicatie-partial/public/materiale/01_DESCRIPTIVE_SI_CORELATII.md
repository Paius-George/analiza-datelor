# 1. Cum citești datele și legăturile dintre ele

## 1. dim și head — câte date ai?

**Ce vezi:**

```text
[1] 116 12
```

**Cum înțelegi:** primul număr spune câte regiuni sunt; al doilea spune câți indicatori ai pentru fiecare regiune.

**La test poți spune:** „Setul conține 116 observații și 12 variabile.”

**Reține:** rânduri = regiuni; coloane = indicatori. `head` arată doar primele rânduri, ca o mostră din tabel. Nu înseamnă că restul au dispărut.

## 2. Mean, Median, SD — nivelul obișnuit și diferențele

**Ce vezi pentru șomaj:**

```text
Mean 6.54    Median 6.30    SD 3.13
```

**Cum înțelegi:**

- **Mean:** media ratelor din toate regiunile este 6,54%.
- **Median:** dacă pui regiunile în ordine, valoarea din mijloc este 6,30%.
- **SD:** arată cât de împrăștiate sunt valorile. SD mai mare înseamnă diferențe mai mari, când compari aceeași variabilă sau aceeași scară.

**La test poți spune:** „Rata medie a șomajului este 6,54%, mediana este 6,30%, iar abaterea standard este 3,13 puncte procentuale.”

**Reține:** medie = nivel mediu; mediană = mijloc; SD = împrăștiere. SD nu spune că șomajul a crescut în timp.

## 3. Quantile — unde se află partea centrală?

**Ce vezi:**

```text
Min 1.70   Q1 4.00   Median 6.30   Q3 8.05   Max 16.50
```

**Cum înțelegi:** cea mai mică rată este 1,70%, cea mai mare este 16,50%. Între Q1 și Q3 se află jumătatea centrală a datelor.

**La test poți spune:** „Jumătatea centrală a ratelor este între 4,00% și 8,05%; toate valorile se află între 1,70% și 16,50%.”

**Reține:** Q1–Q3 = jumătatea din mijloc.

## 4. Outlieri — valori care ies în evidență

**Ce vezi:**

```text
X1: 2 valori extreme    X2: 0    X12: 12
```

**Cum înțelegi:** regula boxplotului a semnalat două valori neobișnuite la X1 și 12 la densitate. La X2 nu a semnalat niciuna.

**La test poți spune:** „Densitatea are 12 observații potențial atipice. Le verificăm înainte să decidem dacă sunt erori sau particularități reale.”

**Reține:** neobișnuit nu înseamnă automat greșit. Numărul nu spune singur dacă sunt valori foarte mari sau foarte mici. Lipsa outlierilor nu dovedește normalitatea.

## 5. Correlation / cor — cum se mișcă două variabile împreună?

**Ce vezi:**

```text
                         Internet zilnic    PIB
Internet zilnic               1.000        0.585
PIB                           0.585        1.000
```

Citești celula de la întâlnirea celor doi indicatori: **0,585**.

- **Plus:** valori mari ale unuia tind să apară cu valori mari ale celuilalt.
- **Minus:** valori mari ale unuia tind să apară cu valori mici ale celuilalt.
- **Aproape de zero:** legătura liniară este slabă.

**La test poți spune:** „Corelația 0,585 indică asociere liniară pozitivă între internetul zilnic și PIB/locuitor.”

**Alt exemplu:** ocupare–șomaj = −0,739. Spui: „Ocuparea ridicată tinde să fie asociată cu șomaj redus.” Ratele nu sunt negative; legătura dintre ele este negativă.

**Reține:** semnul spune sensul; apropierea de −1 sau +1 spune intensitatea. Diagonala este 1 deoarece fiecare variabilă este perfect corelată cu ea însăși. Tabelul este simetric.

Dacă r=0,03, spui „legătură liniară foarte slabă”, nu „nicio relație posibilă”. Corelația nu demonstrează că o variabilă o provoacă pe cealaltă. Fără un test sau interval relevant, nu afirmi că este semnificativă statistic.

## 6. Pearson și Spearman — două moduri de a privi legătura

**Ce vezi:**

```text
Pearson 0.585    Spearman 0.662
```

**Cum înțelegi:** Pearson urmărește o legătură de tip linie dreaptă. Spearman lucrează cu ordinea valorilor: regiunile aflate mai sus la un indicator tind să fie mai sus și la celălalt?

**La test poți spune:** „Ambele valori indică asociere pozitivă; Pearson măsoară asocierea liniară, iar Spearman asocierea monotonă, folosind rangurile.”

## 7. Covarianță — atenție, nu este corelație

**Exemplu didactic:**

```text
       A    B
A      4   -3
B     -3    9
```

**Cum înțelegi:** pe diagonală sunt varianțele: cât de împrăștiată este fiecare variabilă. În afara diagonalei este covarianța: sensul variației împreună.

**La test poți spune:** „A are varianța 4, B are varianța 9, iar covarianța negativă indică variație în sens opus.”

**Reține:** corelația stă între −1 și 1. Covarianța poate fi −3, 9 sau alte valori; depinde de unități.

## 8. Medie zero și SD unu — date standardizate

**Exemplu de output:**

```text
Medii: 2e-16  -1e-16
SD:    1       1
```

**Cum înțelegi:** indicatorii au fost aduși la o scară comună. Nu mai compari direct mii de PPS cu câteva procente. Numerele de tip e−16 sunt extrem de mici, practic zero în acest calcul.

**La test poți spune:** „Variabilele sunt standardizate: mediile sunt aproximativ zero, iar abaterile standard sunt unu.”

**Reține:** aceeași scară nu înseamnă aceeași formă a distribuției. Extremele pot rămâne, iar datele nu devin automat normale.

[Înapoi](00_INCEPE_AICI.md) · [Urmează: ACP](02_ACP_OUTPUTURI_NUMERICE.md)
