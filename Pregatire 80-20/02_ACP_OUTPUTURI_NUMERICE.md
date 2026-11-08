# 2. ACP — interpretarea tabelelor și verificărilor

## summary: cât explică axele?

**Fragment rotunjit:**

```text
                         PC1     PC2     PC3     PC4
Standard deviation      2.5911  1.3140  1.0468  0.8188
Proportion of Variance  0.5595  0.1439  0.0913  0.0559
Cumulative Proportion   0.5595  0.7034  0.7947  0.8506
```

**Spui:** „Prima componentă explică 55,95% din variație. Primele două explică 70,34%, iar primele patru 85,06%. Pentru minimum 80% rețin patru componente.”

`Standard deviation` este abaterea standard a componentei. `Proportion` este procentul împărțit la 100. `Cumulative` se referă la toate axele până la coloana respectivă.

## Valori proprii: eigen / sdev² / PCA$eig

**Vezi:**

```text
       lambda    procent   cumulat
PC1     6.714     55.95     55.95
PC2     1.727     14.39     70.34
PC3     1.096      9.13     79.47
PC4     0.670      5.59     85.06
```

**Spui:** „Varianțele componentelor sunt valorile lambda. Kaiser recomandă trei axe cu lambda peste 1. Pragul de 80% conduce la patru axe.”

În ACP pe corelații, suma lambda este numărul variabilelor: aici 12. Pe covarianțe, suma este suma varianțelor originale; pragul Kaiser 1 nu se aplică mecanic.

## Vectori proprii și loadings

**Fragment pentru PC1:**

```text
Ocupare      0.3303
Somaj       -0.2281
NEET        -0.3500
```

**Spui:** „Componenta combină pozitiv ocuparea și negativ șomajul și NEET. Coeficienții sunt ponderile algebrice ale combinației liniare, nu procente și nici direct corelații.”

Aceeași coloană cu toate semnele inversate reprezintă aceeași axă orientată opus. Dacă apar spații goale în afișarea loadings, R poate ascunde coeficienții mici.

## Matricea factor: denumește componenta

**Fragment pentru PC1:**

```text
Cumparaturi online   0.901
Ocupare              0.856
Somaj               -0.591
NEET                -0.907
```

**Spui:** „Prima componentă opune participarea digitală și ocuparea șomajului și NEET. Sensul pozitiv descrie integrare digitală și pe piața muncii.”

Aici valorile sunt corelații. Dacă semnele se inversează, sensul favorabil se mută pe partea negativă; citești outputul primit.

## Scores: poziția observațiilor

**Vezi:**

```text
          PC1     PC2
RO11    -2.754  -1.241
BE10     0.878   6.169
```

**Spui:** „RO11 are poziție negativă pe ambele axe, iar BE10 are un scor ridicat pe PC2. Dacă PC1 descrie integrarea digitală și economică, RO11 este sub centrul eșantionului pe această dimensiune.”

6,169 este un scor, deci poate depăși 1. Scorurile negative nu înseamnă valori originale negative. Matricea completă are 116×12; primele patru coloane au 116×4.

## Corelațiile și mediile scorurilor

**Exemplu de output:**

```text
          PC1  PC2
PC1        1    0
PC2        0    1
Medii:     0    0
```

**Spui:** „Componentele sunt centrate și necorelate între ele. Necorelarea nu dovedește automat independența.”

## Verificări: erori foarte mici și identități

**Exemple de outputuri de control:**

```text
Eroare scoruri manuale: 4e-14
Eroare reconstructie:  2e-14
Suma lambda:          12
```

**Spui:** „Calculul manual și scorurile coincid la precizia numerică. Reconstrucția cu toate componentele recuperează datele standardizate. Cele 12 axe conservă varianța totală de 12.”

Dacă determinantul matricei analizate și produsul lambda coincid: „Se conservă și varianța generalizată.” Acestea sunt verificări matematice, fără concluzie cauzală economică.

## Compararea princomp și PCA

**Exemplu de output:**

```text
Diferente maxime: lambda 1e-14, scoruri 4e-14, matrice factor 7e-15
```

**Spui:** „Cele două metode dau rezultate echivalente la precizia numerică, pe aceleași date și după alinierea semnelor axelor.”

O diagonală de −1 în corelația scorurilor corespunzătoare poate indica doar semne opuse. Compari scorurile cu `ind$coord`, iar matricea factor cu `var$coord` în ACP standardizată; loadings și var$coord sunt obiecte diferite.

[Înapoi la început](00_INCEPE_AICI.md) · [Urmează: variabile și regiuni](03_PCA_VARIABILE_SI_REGIUNI.md)
