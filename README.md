# Analiza Datelor

Materiale de curs, seminarii și aplicația de pregătire pentru parțial.

Pentru modelul de test: deschide [instaleaza_test_ACP.R](instaleaza_test_ACP.R)
în RStudio și apasă **Source** o singură dată, cu internet disponibil. Apoi
deschide [cod_test_ACP.R](cod_test_ACP.R) și apasă **Source** pentru analiză.
Codul găsește automat `Rezolvare Seminar/centralizare.xlsx`, păstrând structura
folderelor, și exclude coloana cu anul. R și RStudio trebuie să fie instalate.
Deschiderea unui fișier R afișează codul; **Source** îl execută.

Outputurile folosesc formatul standard din codul profesorului și testele 11–20:
`summary(acp)` din `princomp`, `MF = cor(X, acp$scores)`, `corrplot`,
`summary(acp2)` cu secțiunile Eigenvalues, Individuals și Variables și graficul
`fviz_pca_ind(acp2)`. Numerele depind de datele încărcate; variantele de pe site
folosesc date sintetice proprii. Semnele axelor pot diferi între cele două metode;
pentru graficul FactoMineR se interpretează corelațiile din `summary(acp2)`.

Scriptul urmează cele cinci cerințe din fotografie: matricea de corelație,
criteriile Kaiser și variației cumulate (prag implicit 80%), matricea factor,
corelațiile și contribuțiile variabilelor, graficul regiunilor și scorurile
extreme. Graficul se salvează în `rezultate/grafice`, relativ la directorul de
lucru din R (`getwd()`). Pentru alte date, completează variabila `fisier` cu
calea Excelului profesorului și verifică foaia, identificatorul regiunilor și
coloanele numerice de exclus.

Aplicația este în [`aplicatie-partial/`](aplicatie-partial/README.md). Include 73 de lecții, exerciții cu feedback, cartonașe și patru simulări de parțial. Progresul se păstrează în browserul fiecărui coleg.

## Acces pentru colegi

Codul se păstrează într-un repository **privat**. Aplicația se publică pe Cloudflare Workers și se protejează cu Cloudflare Access: proprietarul aprobă individual adresele de e-mail, iar colegii se autentifică prin cod primit pe e-mail. Trimiterea linkului nu oferă acces unei adrese neaprobate.

Instrucțiunile de activare sunt în [PUBLICARE.md](aplicatie-partial/docs/PUBLICARE.md). GitHub Actions verifică aplicația la fiecare actualizare și o publică după configurarea contului Cloudflare. Prima publicare este blocată până sunt configurate datele Cloudflare Access.

Repository-ul nu folosește GitHub Pages. Fișierele existente de curs și seminar sunt păstrate.
