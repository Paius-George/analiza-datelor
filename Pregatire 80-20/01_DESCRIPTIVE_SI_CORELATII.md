# 1. Descriptive și corelații — interpretări scurte

## Dimensiuni și primele rânduri: dim / head

**Vezi:**

```text
[1] 116 12
```

**Spui:** „Setul are 116 observații și 12 variabile. În proiect, observațiile sunt regiuni, iar variabilele sunt indicatori.”

`head` arată numai primele rânduri, nu întregul set. Un număr mare în coloana PIB este o valoare observată, nu o medie.

## Media, mediana și abaterea standard

**Vezi pentru șomaj:**

```text
Mean 6.54    Median 6.30    SD 3.13
```

**Spui:** „Rata medie a șomajului este 6,54%, iar valoarea centrală este 6,30%. Dispersia, măsurată prin abaterea standard, este 3,13 puncte procentuale.”

SD nu reprezintă o creștere în timp și nu este marja de eroare a mediei.

## Cuantile: quantile

**Vezi:**

```text
Min 1.70    Q1 4.00    Median 6.30    Q3 8.05    Max 16.50
```

**Spui:** „Jumătatea centrală a ratelor se află între 4,00% și 8,05%. Valorile observate variază între 1,70% și 16,50%.”

## Lista sau numărul outlierilor

**Vezi:**

```text
X1: 2 valori extreme    X2: 0    X12: 12
```

**Spui:** „Densitatea are 12 observații semnalate ca extreme potrivit regulii boxplotului; X2 nu are observații semnalate prin această regulă. O valoare extremă trebuie verificată, fără eliminare automată.”

Absența outlierilor nu dovedește normalitatea. Numărul singur nu spune dacă extremele sunt mari sau mici; citești și valorile/graficul.

## Matricea corelațiilor: cor

**Vezi:**

```text
                    Internet zilnic    PIB
Internet zilnic           1.000       0.585
PIB                       0.585       1.000
```

**Spui:** „Există asociere liniară pozitivă: regiunile cu internet zilnic mai ridicat tind să aibă PIB/locuitor mai mare. Corelația este 0,585; rezultatul nu demonstrează cauzalitate.”

Dacă primești −0,739 între ocupare și șomaj: „Ocuparea ridicată tinde să coexiste cu șomaj redus.” Semnul minus nu înseamnă valori negative ale ratelor.

Diagonala 1 reprezintă corelația fiecărei variabile cu ea însăși. Matricea este simetrică.

## Pearson versus Spearman

**Vezi:**

```text
Pearson 0.585    Spearman 0.662
```

**Spui:** „Ambii coeficienți indică asociere pozitivă. Pearson descrie asocierea liniară, iar Spearman asocierea monotonă pe baza rangurilor.”

Fără test sau interval relevant, nu afirmi automat semnificație statistică.

## Matricea covarianțelor

**Exemplu didactic:**

```text
       A    B
A      4   -3
B     -3    9
```

**Spui:** „Varianțele sunt 4 și 9. Covarianța negativă sugerează variație în sens opus; −3 nu este un coeficient de corelație și nu se compară direct cu pragurile acesteia.”

## Verificarea standardizării

**Exemplu de output:**

```text
Medii: 2e-16  -1e-16
SD:    1       1
```

**Spui:** „Variabilele sunt centrate și standardizate: mediile sunt aproximativ zero, iar abaterile standard sunt unu. Valorile foarte mici sunt efecte ale preciziei numerice.”

Standardizarea permite compararea scărilor; nu elimină extremele și nu produce automat distribuții normale.

[Înapoi la început](00_INCEPE_AICI.md) · [Urmează: ACP numeric](02_ACP_OUTPUTURI_NUMERICE.md)
