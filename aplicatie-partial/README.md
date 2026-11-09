# Laboratorul de parțial

Aplicație în română pentru Analiza Datelor:

- 55 de lecții, cu text, tabele și grafice originale;
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
