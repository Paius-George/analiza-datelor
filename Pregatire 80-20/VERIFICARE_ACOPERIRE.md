# Verificarea acoperirii fișelor 80/20

Verificat la 9 noiembrie 2026, prin compararea celor șase fișe cu cele trei PDF-uri de seminar și scripturile curente din `Rezolvare Seminar`. Nu au fost executate analizele R. Au fost citite fișierele existente și definiția locală a afișării loadings pentru a verifica etichetele acesteia.

**Concluzie:** principalele tipuri de output și toate familiile de grafice erau prezente. Lipseau câteva interpretări punctuale; au fost completate direct în fișe, cu exemple scurte. Acest document este evidența verificării, fără a fi o lecție suplimentară.

| Output / cerință verificată | Unde este acoperit acum |
|---|---|
| dim, head, statistici, cuantile, outlieri | 01 — descriptive |
| corelație, Pearson/Spearman, covarianță, standardizare | 01 — descriptive |
| histograme, boxploturi originale/standardizate, plot(X), scatterplot, corrplot | 04 — grafice |
| trei și patru variabile în același grafic | 04 — grafice |
| eigen, sdev, sdev², summary, valori proprii | 02 — ACP numeric |
| Kaiser, TRUE/FALSE, prag cumulat și scree plot | 02 și 04 |
| loadings, vectori proprii, norme și ortogonalitate | 02; completată interpretarea SS loadings și crossprod(V) |
| scoruri, dimensiuni, primele rânduri și calcul manual | 02; completată diferența de standardizare n−1/n |
| medii/corelații/varianțe ale scorurilor, reconstrucție, conservarea varianței totale și generalizate | 02 — ACP numeric |
| matricea factor, legătura cu loadings, interpretarea și semnele axelor | 02; adăugate legătura numerică și exemplul PC2 mixt |
| PCA versus princomp, aliniere de semne, erori numerice | 02 — ACP numeric |
| ncp versus numărul de axe ales pentru interpretare | 02 — ACP numeric |
| Variables: coordonate, cos², contribuții, calitate în plan și sume | 03; completată suma cos² pe coloană = lambda |
| Individuals: scoruri, Dist/Dist², masă, inerție, contribuții și cos² | 03; adăugate masa, Dist² și inerția |
| cercuri PC1–PC2 și PC3–PC4, culori contrib/cos² | 04; completate direcțiile perpendiculare |
| regiuni PC1–PC2 și PC3–PC4, cos² și apropierea de origine | 04; completată limita interpretării originii |
| biplot și biplot vertical, cele două scări | 04 — grafice |
| primele patru componente într-un singur grafic | 04 — grafice |

Au fost adăugate și dicționarul scurt al indicatorilor, în 00, și reperele noi în recapitulare, 05. Extracția Eurostat, formulele Excel și instalarea pachetelor nu sunt dezvoltate: scopul acestor fișe rămâne interpretarea outputurilor, conform cererii.

Verificarea nu presupune că profesorul va folosi aceleași numere. Toate exemplele se citesc în convenția și pe axele outputului primit.

## După rescrierea explicațiilor

Cele șase fișe au fost rescrise în limbaj mai simplu, cu exemple și formulări pentru test. Au rămas acoperite toate categoriile din tabelul de mai sus, inclusiv masa/inerția, SS loadings, crossprod(V), sumele cos² și diferența n−1/n. Versiunile anterioare sunt păstrate separat în `../Arhiva fise 80-20/Inainte de explicatii simple 2026-11-09/`. Nu au fost executate analize R.
