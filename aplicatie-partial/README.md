# Laboratorul de parțial

Aplicație în română pentru Analiza Datelor:

- 73 de lecții, cu text, tabele și grafice originale;
- exerciții cu feedback și repetarea greșelilor;
- 20 de cartonașe și patru variante de parțial;
- cronometru și progres păstrate pe dispozitiv prin localStorage;
- exportul rezultatelor și progresului.

## Pornire locală

Necesită Node.js 22.13 sau mai nou.

```sh
npm ci
npm run dev
```

Deschide `http://127.0.0.1:5173`. Serverul local de dezvoltare servește aplicația fără login și ascultă doar pe calculatorul tău.

## Verificări

```sh
npm test
npm run build
npm run typecheck
npx --no-install wrangler deploy --dry-run
```

Buildul Next.js exportă aplicația în `out/`. Workerul verifică semnătura, emitentul, audiența și expirarea tokenului Cloudflare Access înainte să servească orice fișier. Configurația incompletă blochează accesul cu 503. Tokenurile lipsă sau invalide sunt refuzate cu 403. Testele acoperă și linkurile directe către fișe, imagini, fonturi și JavaScript.

`npm run preview:protected` pornește Workerul local; fără configurare și autentificare acesta trebuie să răspundă cu 503.

## Publicare și aprobarea colegilor

Urmează [docs/PUBLICARE.md](docs/PUBLICARE.md). Publicarea folosește GitHub Actions și contul Cloudflare al proprietarului. Lista adreselor aprobate se gestionează în Cloudflare, fără modificarea codului.

## Actualizarea conținutului

Teoria este în `content/theory.json`, iar exercițiile în `content/practice.json`.

Pentru reimportarea fișelor din `../Pregatire 80-20`, instalează pachetele Python `markdown` și `beautifulsoup4`, apoi rulează `python3 scripts/import-theory.py`. Scriptul nu modifică fișele sursă.

Punctajele sunt pentru antrenament. Progresul nu se sincronizează între dispozitive. Schimbarea adresei site-ului nu transferă automat progresul local; exportă-l înainte de mutare.

## Cele 10 teste după modelul profesorului

Meniul **10 teste ca la parțial** (`#modele-profesor`) conține modelul din fotografie și nouă variante noi. Toate au aceleași cinci cerințe, 40 de minute și punctaje 1+2+2+2+2, plus un punct din oficiu. Nu înlocuiesc cele patru simulări anterioare.

Fotografia conține numai cerințele; outputurile primului model sunt calculate pe cele 116 regiuni și 12 variabile din `Rezolvare Seminar/digitalizare.txt`. Celelalte nouă seturi sunt sintetice și etichetate explicit. Rezolvările și baremele sunt orientative, pentru pregătire, nu bareme oficiale ale profesorului.

Fiecare model oferă un mod de studiu cu rezolvări explicate și o simulare cu răspunsuri libere. Simularea persistă în browser, se încheie la expirarea celor 40 de minute și oferă autoevaluare pe criterii. Nota nu este generată automat din text. Progresul acestor modele are propria cheie localStorage, `analiza-datelor-professor-exams-v1`; exportul și resetarea progresului vechi nu o includ. Răspunsurile se pot descărca separat după predarea fiecărui test.

Surse: `content/professor-exams.json`, `components/ProfessorExams.tsx` și `public/professor-exams/` (fotografie, date CSV, grafice SVG, scripturi R și rezolvări MD). Scripturile R folosesc exclusiv funcții de bază și sunt oferite pentru rulare manuală; nu sunt executate de aplicație.

Pentru regenerarea deterministă a exercițiilor, într-un mediu Python cu `numpy` și `matplotlib`, rulează `python scripts/generate-professor-exams.py`. Generatorul folosește fotografia inclusă în `public/professor-exams/model-profesor-original.png`, citește datele din repo și nu rulează R. Testele verifică baremul și concordanța matematică a valorilor proprii, matricei factor, corelațiilor, contribuțiilor și scorurilor.
