# Analiza Datelor

Materiale de curs, seminarii și aplicația de pregătire pentru parțial.

Codul R pentru cele cinci cerințe din fotografia modelului de test este în
[cod_test_ACP.R](cod_test_ACP.R). La import alegi Excelul profesorului; setezi
foaia și, dacă este cazul, coloana cu identificatorul regiunilor și coloanele
numerice de exclus (de exemplu ID sau an). Scriptul afișează matricea de
corelație, criteriile Kaiser și variației cumulate, matricea factor, corelațiile
și contribuțiile variabilelor, apoi graficul regiunilor și scorurile extreme.
Pragul implicit este 80%. Graficul se salvează în `rezultate/grafice`, relativ
la directorul de lucru din R (`getwd()`). Instalarea pachetelor este explicată
în primele comentarii ale scriptului.

Aplicația este în [`aplicatie-partial/`](aplicatie-partial/README.md). Include 73 de lecții, exerciții cu feedback, cartonașe și patru simulări de parțial. Progresul se păstrează în browserul fiecărui coleg.

## Acces pentru colegi

Codul se păstrează într-un repository **privat**. Aplicația se publică pe Cloudflare Workers și se protejează cu Cloudflare Access: proprietarul aprobă individual adresele de e-mail, iar colegii se autentifică prin cod primit pe e-mail. Trimiterea linkului nu oferă acces unei adrese neaprobate.

Instrucțiunile de activare sunt în [PUBLICARE.md](aplicatie-partial/docs/PUBLICARE.md). GitHub Actions verifică aplicația la fiecare actualizare și o publică după configurarea contului Cloudflare. Prima publicare este blocată până sunt configurate datele Cloudflare Access.

Repository-ul nu folosește GitHub Pages. Fișierele existente de curs și seminar sunt păstrate.
