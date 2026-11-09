# Analiza Datelor

Materiale de curs, seminarii și aplicația de pregătire pentru parțial.

Aplicația este în [`aplicatie-partial/`](aplicatie-partial/README.md). Include 73 de lecții, exerciții cu feedback, cartonașe și patru simulări de parțial. Progresul se păstrează în browserul fiecărui coleg.

## Acces pentru colegi

Codul se păstrează într-un repository **privat**. Aplicația se publică pe Cloudflare Workers și se protejează cu Cloudflare Access: proprietarul aprobă individual adresele de e-mail, iar colegii se autentifică prin cod primit pe e-mail. Trimiterea linkului nu oferă acces unei adrese neaprobate.

Instrucțiunile de activare sunt în [PUBLICARE.md](aplicatie-partial/docs/PUBLICARE.md). GitHub Actions verifică aplicația la fiecare actualizare și o publică după configurarea contului Cloudflare. Prima publicare este blocată până sunt configurate datele Cloudflare Access.

Repository-ul nu folosește GitHub Pages. Fișierele existente de curs și seminar sunt păstrate.
