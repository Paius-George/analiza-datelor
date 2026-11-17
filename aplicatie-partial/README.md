# Fișele 80/20 — două materii

Pe desktop, **Scală: 70% / 80% / 90% / 100%** micșorează proporțional întreaga
interfață, independent de zoom-ul browserului. Valoarea implicită este 100%,
pentru a nu schimba celelalte dispozitive; preferința se salvează în browser.
Pe mobil și la imprimare se păstrează scala normală.

Pe desktop, selectorul **Aspect: Compact / Aerisit** reglează spațierea și
bannerele; alegerea se salvează separat în browser, fără a modifica progresul
sau dimensiunea textului lecțiilor. Modul Compact este implicit de la 1024 px;
pe mobil se păstrează layoutul dedicat.

Homepage-ul `/` permite alegerea materiei. **Analiza Datelor** este la
`/analiza-datelor/`; vechile linkuri `/#lectii`, `/#modele-profesor/...` etc.
funcționează prin redirecționare cu păstrarea hash-ului. **Cibernetica sistemelor
economice** este la `/cibernetica/`.

CSE include **40 de lecții**, 53 de întrebări, cartonașe și calculator.
Pentru informațiile noi despre parțial:

- `/cibernetica/#partial-ghid`: șapte fișe 80/20, exemple, răspunsuri de
  3–4 propoziții, capcane și un traseu de 120 minute.
- `/cibernetica/#partial`: **60 de variante** cu 2 puncte de teorie și 2 de
  probleme, mod învățare și simulare cu timp ales (30/40/60 minute).
- Fiecare variantă are cazuri CAS, VSM/firmă, bancă/shadow banking, trei
  situații ERP/CRM/SCM, PSI și HHI/entropie cu semafor. Sunt 30 de cazuri
  teoretice și 18 situații IT recombinate, plus 60 de seturi numerice distincte.
- Rezolvările includ ponderi, contribuții, formule, interpretări și acțiuni.
  Autoevaluarea pe criterii dă maximum **4 puncte**, fără oficiu și fără
  conversie inventată în notă. Textul nu este corectat semantic automat.
- Răspunsurile, termenul de predare și baremul completat se salvează în
  `cse-partial-2plus2-v1`. La revenire după expirare se predă automat.
  Păstrăm ultimele 60 de încercări. Modul învățare folosește notițe temporare.

Cele 4 simulări generale anterioare (10 întrebări, 1 punct din oficiu + 9
puncte de lucru) rămân în arhivă la `#simulari`, împreună cu progresul lor.
Cheia lor este `cibernetica-sistemelor-economice-8020-v1`, separată de noile
variante și de Analiza Datelor. Durata și împărțirea pe exerciții ale noilor
variante sunt convenții de antrenament, nu baremul oficial al profesorului.

Conținutul nou este în `content/cse-guide.json` și `content/cse-partial.json`.
`node scripts/build-cse-partial.mjs` regenerează determinist variantele și
`public/cse/variante-partial-60.md`. Ghidul separat se descarcă din
`public/cse/ghid-partial-80-20.md`. Cursul 5 confirmă acronimul **CRM**, nu CRL;
soluția se alege după nevoia firmei, nu doar după industria ei. Tabelul despre
shadow banking este explicit o sinteză generală: slide-ul 14 nu este disponibil.

Conținut CSE: `content/cse.json`. Fiecare lecție are esențialul, explicație,
exemplu, răspuns-model, capcană și surse. Fișele noi pot fi descărcate din
`public/cse/fise-80-20.md`; ghidurile originale sunt păstrate separat. Materialele
locale provin din folderul Cibernetica sistemelor economice: ghidul existent,
cursuri și seminarii (VSM, firma adaptivă, banca și cursul 5 despre ERP/CRM/SCM).
Pentru shadow banking, prezentarea specifică lipsește: sinteza este completată
cu surse instituționale FSB/RBI, etichetate ca atare. Bibliografia este accesibilă
în secțiunea Materiale originale; PDF-urile și descărcările rămân protejate de
același Cloudflare Access.

Calculatorul normalizează separat cele două distribuții. PSI cu ponderi zero
este semnalat explicit, fără regularizare tacită; HHI și entropia rămân
calculabile. Pragurile sunt cele orientative din seminarul 4–5: PSI 0,10/0,25;
HHI normalizat 0,10/0,20; entropie 0,60/0,90, cu granițele în galben.
ECL este aproximația didactică PD × LGD × EAD, cu procente convertite corect.

Verificare: `npm test` (40 teste), `npm run typecheck`, `npm run build`.
Verificarea noilor variante în Chromium a inclus mod învățare/simulare,
ascunderea rezolvărilor înainte de predare, salvare după refresh, expirare,
autoevaluare 4/4, progresul vechi păstrat, stocare blocată, descărcări,
mobil fără depășirea lățimii și scala 70%. Verificarea generală a inclus
homepage, progres separat,
lecții, cartonașe, calculator, antrenament, reluarea simulării după refresh,
predare și autoevaluare, plus compatibilitatea unui link vechi către modelul 16.

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

### Variantele 11–20: codul profesorului

`content/code-exams.json` adaugă zece variante bazate pe documentul furnizat `Cod test ACP.docx`, fără modificarea primelor zece. În secțiunea cu 20 de teste poți filtra seria nouă; transcrierea comenzilor se găsește în `public/professor-exams/cod-profesor.R`.

Fiecare variantă include cele cinci cerințe originale, comanda corespunzătoare, tabele de tip `summary(acp)` / `summary(acp2)`, scree plot, matrice factor numerică și planul regiunilor. Datele sunt sintetice, iar rezultatele sunt reconstruite în Python după definițiile funcțiilor, fără executarea R. Transcrierea nu conține datele unui viitor test și nu confirmă subiecte viitoare.

Se exersează explicit: `sdev² = λ`, proporții versus procente, diferența dintre `cor(X, scoruri)` și `acp$loadings`, formatul Variables cu grupuri Dim/ctr/cos2, diferența față de Individuals, limita implicită de 10 elemente și 3 axe în summary, ncp=5 implicit și inversarea semnelor între metode. Pentru noile scoruri standardizarea folosește divizorul n, conform princomp și PCA; primele zece modele își păstrează convenția anterioară.

Regenerare: `python scripts/generate-code-exams.py` într-un mediu cu NumPy și Matplotlib. Comanda rescrie doar seria nouă. Scripturile R descărcabile păstrează comenzile profesorului, cu import CSV înainte și instrucțiuni comentate pentru instalarea manuală a pachetelor corrplot, factoextra și FactoMineR.
