# 5. Repetare — câte o idee pentru fiecare lucru

## Cele cinci întrebări

| Vezi | Te întrebi | Îți amintești |
|---|---|---|
| Loading | Cum intră indicatorul în componentă? | Rețeta |
| Matrice factor | Cât este legat indicatorul de axă? | Legătura |
| Scor | Unde se află regiunea? | Locul |
| Cos² | Cât de bine se vede aici? | Reprezentarea |
| Contribuție | Cât aduce la construirea axei? | Aportul |

## Citești numărul și spui propoziția

| Număr / desen | Ce spui |
|---|---|
| Mean 6,54% | Media ratelor este 6,54% |
| Median 6,30% | Valoarea din mijloc este 6,30% |
| SD 3,13 pentru o rată | Abaterea standard este 3,13 puncte procentuale |
| Q1=4,00%; Q3=8,05% | Jumătatea centrală este între 4,00% și 8,05% |
| Coadă spre dreapta | Câteva valori sunt mult mai mari decât restul |
| Punct separat în boxplot | Valoare neobișnuită care trebuie verificată |
| r=−0,74 | Când unul este mare, celălalt tinde să fie mic |
| Medie≈0, SD=1 | Indicatorul este standardizat |
| Proportion=0,56 | Această axă explică aproximativ 56% |
| Cumulative=0,85 la PC4 | Primele patru axe explică aproximativ 85% |
| Lambda | Varianța componentei; SD înmulțit cu el însuși |
| Variables: Dim=−0,80 | Indicatorul este puternic legat negativ de axă, în ACP standardizată |
| Individuals: Dim=3 | Regiunea are scor pozitiv 3 pe axă |
| Cos²=0,64 | Axa/planul reprezintă 64% din variația indicatorului sau din distanța pătratică a regiunii |
| Ctr=20% | Obiectul aduce 20% la construirea axei |
| Dist mare | Regiunea este departe de centrul datelor |
| Masă=1/116 | Regiunea contează la fel ca fiecare dintre celelalte |
| Inerție=0,6992 | Aport la împrăștierea totală, fără procent automat |
| Săgeată scurtă în cerc | Indicatorul se vede incomplet în acest plan |
| Puncte apropiate | Scoruri apropiate pe axele afișate |
| Biplot | Regiuni și indicatori în același desen |
| Eroare 1e−14 | Rezultatele comparate practic coincid |

## Verificările mai rare

- **SS loadings=1:** coeficienții au normă unu. Procentele explicate se citesc în summary.
- **crossprod(V) cu 1 pe diagonală și 0 în rest:** direcțiile coeficienților sunt unitare și perpendiculare.
- **Suma cos² pe o coloană de variabile:** lambda axei, în ACP standardizată.
- **Contribuții pe o axă:** total 100%, adunând toate variabilele sau toate regiunile.
- **Cos² pe toate axele pentru același obiect:** total 1, pentru o regiune cu distanță nenulă.
- **Scoruri manuale puțin diferite:** verifică standardizarea cu n−1 versus n.
- **Suma lambda=12:** păstrarea variației totale a celor 12 indicatori standardizați.
- **Produs lambda=determinant:** păstrarea varianței generalizate.
- **ncp=12:** coordonate stocate pentru 12 axe; numărul interpretat se alege separat.

## Două propoziții pentru orice output

> „Acest tabel/grafic arată … . Valoarea/poziția … înseamnă că … .”

Apoi, dacă este cazul: „Mă refer la planul afișat” sau „Este o asociere, fără concluzie cauzală”.

**Ultima verificare:** citesc indicatori sau regiuni? Ce axe sunt afișate? Ce arată culoarea? Ce arată mărimea?

[Înapoi la început](00_INCEPE_AICI.md)
