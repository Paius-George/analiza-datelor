# CSE — 60 de variante pentru parțial

2 puncte teorie + 2 puncte probleme

Variante didactice după temele comunicate. Împărțirea pe exerciții și timpul de lucru sunt pentru antrenament; nu reprezintă un barem oficial. Nu se presupun puncte din oficiu și nu se transformă punctajul în notă.

Praguri din seminar: PSI < 0,10 verde, [0,10; 0,25] galben, > 0,25 roșu. HHI normalizat < 0,10 verde, [0,10; 0,20] galben, > 0,20 roșu. Entropie normalizată > 0,90 verde, [0,60; 0,90] galben, < 0,60 roșu. La examen, folosește pragurile furnizate în enunț.


## Varianta 1


### 1. Conectivitate — 0.5 p

O platformă transmite în timp real comenzile între clienți, comercianți și curieri. Identifică proprietatea CAS evidențiată și explică indiciul.


**Rezolvare**


Este conectivitate: agenții sunt legați printr-o rețea de comunicare. Dovada este transmiterea comenzilor între clienți, comercianți și curieri. Aceste legături permit circulația informației și coordonarea acțiunilor.


**Barem de autoevaluare**


- 0.2 p: Numești conectivitatea

- 0.15 p: indici legăturile din text

- 0.15 p: explici circulația informației


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
2. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
3. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 50 | 48 |
| Clasa 2 | 30 | 31 |
| Clasa 3 | 20 | 21 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,001632.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,5 | 0,48 | 0,000816 |
| Clasa 2 | 0,3 | 0,31 | 0,000328 |
| Clasa 3 | 0,2 | 0,21 | 0,000488 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 48 |
| Clasa 2 | 31 |
| Clasa 3 | 21 |


**Rezolvare**


q = (0,48; 0,31; 0,21); n = 3.
HHI = Σq² = 0,3706; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,0559.
H = −Σq ln(q) = 1,043108 nats; H normalizată = H/ln(n) = 0,949478.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,48 | 0,2304 | 0,352305 |
| Clasa 2 | 0,31 | 0,0961 | 0,363067 |
| Clasa 3 | 0,21 | 0,0441 | 0,327736 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 2


### 1. Interdependență — 0.5 p

Un furnizor livrează făina cu întârziere; cofetăria amână producția, iar curierii își modifică livrările. Identifică proprietatea CAS și explică lanțul de influență.


**Rezolvare**


Este interdependență: funcționarea unui actor influențează funcționarea celorlalți. Întârzierea furnizorului schimbă producția și apoi livrarea. Nu este doar existența unei legături, ci transmiterea efectelor prin acea legătură.


**Barem de autoevaluare**


- 0.2 p: Numești interdependența

- 0.15 p: urmărești furnizor → producție → livrare

- 0.15 p: deosebești legătura de efect


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
2. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
3. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 60 | 40 |
| Clasa 2 | 30 | 40 |
| Clasa 3 | 10 | 20 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,179176.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,6 | 0,4 | 0,081093 |
| Clasa 2 | 0,3 | 0,4 | 0,028768 |
| Clasa 3 | 0,1 | 0,2 | 0,069315 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 40 |
| Clasa 2 | 40 |
| Clasa 3 | 20 |


**Rezolvare**


q = (0,4; 0,4; 0,2); n = 3.
HHI = Σq² = 0,36; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,04.
H = −Σq ln(q) = 1,05492 nats; H normalizată = H/ln(n) = 0,96023.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,4 | 0,16 | 0,366516 |
| Clasa 2 | 0,4 | 0,16 | 0,366516 |
| Clasa 3 | 0,2 | 0,04 | 0,321888 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 3


### 1. Coevoluție — 0.5 p

O bancă lansează servicii digitale, concurentul introduce servicii mai rapide, iar prima bancă își îmbunătățește oferta ca răspuns. Identifică proprietatea și justifică.


**Rezolvare**


Este coevoluție exogenă, deoarece două organizații se adaptează reciproc. Oferta primei bănci schimbă decizia concurentului, iar răspunsul acestuia determină o nouă schimbare la prima bancă. Evoluția fiecăreia modifică mediul celeilalte.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: identifici cele două sensuri ale influenței

- 0.15 p: explici adaptarea reciprocă


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
2. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
3. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 70 | 35 |
| Clasa 2 | 20 | 35 |
| Clasa 3 | 10 | 30 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,546266.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,7 | 0,35 | 0,242602 |
| Clasa 2 | 0,2 | 0,35 | 0,083942 |
| Clasa 3 | 0,1 | 0,3 | 0,219722 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 35 |
| Clasa 2 | 35 |
| Clasa 3 | 30 |


**Rezolvare**


q = (0,35; 0,35; 0,3); n = 3.
HHI = Σq² = 0,335; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,0025.
H = −Σq ln(q) = 1,096067 nats; H normalizată = H/ln(n) = 0,997683.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,35 | 0,1225 | 0,367438 |
| Clasa 2 | 0,35 | 0,1225 | 0,367438 |
| Clasa 3 | 0,3 | 0,09 | 0,361192 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 4


### 1. Auto-organizare — 0.5 p

Într-un depozit, angajații își redistribuie spontan sarcinile când apare aglomerație, fără instrucțiuni de la manager. Identifică proprietatea și dovada.


**Rezolvare**


Este auto-organizare: ordinea apare din interacțiunile locale ale angajaților. Dovada este redistribuirea spontană, fără comandă centrală. Echipa își reorganizează activitatea pentru a răspunde situației.


**Barem de autoevaluare**


- 0.2 p: Numești auto-organizarea

- 0.15 p: observi lipsa comenzii centrale

- 0.15 p: explici ordinea apărută local


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
2. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
3. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 30 | 90 |
| Clasa 2 | 30 | 5 |
| Clasa 3 | 40 | 5 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,834912.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,3 | 0,9 | 0,659167 |
| Clasa 2 | 0,3 | 0,05 | 0,44794 |
| Clasa 3 | 0,4 | 0,05 | 0,727805 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 90 |
| Clasa 2 | 5 |
| Clasa 3 | 5 |


**Rezolvare**


q = (0,9; 0,05; 0,05); n = 3.
HHI = Σq² = 0,815; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,7225.
H = −Σq ln(q) = 0,394398 nats; H normalizată = H/ln(n) = 0,358996.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,9 | 0,81 | 0,094824 |
| Clasa 2 | 0,05 | 0,0025 | 0,149787 |
| Clasa 3 | 0,05 | 0,0025 | 0,149787 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 5


### 1. Emergență — 0.5 p

Mulți clienți își retrag separat economiile, iar retragerile cumulate produc o criză de lichiditate a băncii. Distinge acțiunea individuală de fenomenul emergent.


**Rezolvare**


Acțiunea individuală este retragerea banilor de către un client. Fenomenul emergent este criza de lichiditate la nivelul băncii, apărută prin cumularea și interacțiunea comportamentelor clienților. Criza este o stare a sistemului, nu acțiunea unui singur client.


**Barem de autoevaluare**


- 0.2 p: Numești emergența

- 0.15 p: identifici retragerea individuală

- 0.15 p: identifici criza la nivelul sistemului


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
2. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
3. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 34 | 60 |
| Clasa 2 | 33 | 25 |
| Clasa 3 | 33 | 15 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,311809.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,34 | 0,6 | 0,147676 |
| Clasa 2 | 0,33 | 0,25 | 0,022211 |
| Clasa 3 | 0,33 | 0,15 | 0,141922 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 60 |
| Clasa 2 | 25 |
| Clasa 3 | 15 |


**Rezolvare**


q = (0,6; 0,25; 0,15); n = 3.
HHI = Σq² = 0,445; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,1675.
H = −Σq ln(q) = 0,937637 nats; H normalizată = H/ln(n) = 0,853474.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,6 | 0,36 | 0,306495 |
| Clasa 2 | 0,25 | 0,0625 | 0,346574 |
| Clasa 3 | 0,15 | 0,0225 | 0,284568 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 6


### 1. Feedback pozitiv — 0.5 p

Un zvon provoacă retrageri, retragerile reduc lichiditatea și sporesc teama, iar teama determină alte retrageri. Identifică feedbackul și explică bucla.


**Rezolvare**


Feedbackul este pozitiv, fiindcă amplifică schimbarea inițială. Retragerile reduc lichiditatea, ceea ce mărește teama și produce noi retrageri. Pozitiv înseamnă amplificator, nu benefic pentru bancă.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul pozitiv

- 0.15 p: închizi bucla retrageri → teamă → retrageri

- 0.15 p: explici amplificarea


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
2. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
3. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 25 | 65 |
| Clasa 2 | 25 | 15 |
| Clasa 3 | 25 | 10 |
| Clasa 4 | 25 | 10 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,708174.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,25 | 0,65 | 0,382205 |
| Clasa 2 | 0,25 | 0,15 | 0,051083 |
| Clasa 3 | 0,25 | 0,1 | 0,137444 |
| Clasa 4 | 0,25 | 0,1 | 0,137444 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 65 |
| Clasa 2 | 15 |
| Clasa 3 | 10 |
| Clasa 4 | 10 |


**Rezolvare**


q = (0,65; 0,15; 0,1; 0,1); n = 4.
HHI = Σq² = 0,465; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,286667.
H = −Σq ln(q) = 1,025094 nats; H normalizată = H/ln(n) = 0,739449.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,65 | 0,4225 | 0,280009 |
| Clasa 2 | 0,15 | 0,0225 | 0,284568 |
| Clasa 3 | 0,1 | 0,01 | 0,230259 |
| Clasa 4 | 0,1 | 0,01 | 0,230259 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 7


### 1. Feedback negativ — 0.5 p

Creșterea întârzierilor la livrare determină suplimentarea temporară a personalului; întârzierile scad spre ținta stabilită. Identifică feedbackul și explică.


**Rezolvare**


Feedbackul este negativ: reacția reduce abaterea față de ținta de livrare. Întârzierile declanșează suplimentarea personalului, care le diminuează. Negativ descrie efectul corectiv al buclei, nu o consecință nedorită.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul negativ

- 0.15 p: identifici abaterea și reacția

- 0.15 p: explici reducerea abaterii


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
2. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
3. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 40 | 38 |
| Clasa 2 | 30 | 32 |
| Clasa 3 | 20 | 19 |
| Clasa 4 | 10 | 11 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,003783.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,4 | 0,38 | 0,001026 |
| Clasa 2 | 0,3 | 0,32 | 0,001291 |
| Clasa 3 | 0,2 | 0,19 | 0,000513 |
| Clasa 4 | 0,1 | 0,11 | 0,000953 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 38 |
| Clasa 2 | 32 |
| Clasa 3 | 19 |
| Clasa 4 | 11 |


**Rezolvare**


q = (0,38; 0,32; 0,19; 0,11); n = 4.
HHI = Σq² = 0,295; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,06.
H = −Σq ln(q) = 1,29064 nats; H normalizată = H/ln(n) = 0,931.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,38 | 0,1444 | 0,367682 |
| Clasa 2 | 0,32 | 0,1024 | 0,364619 |
| Clasa 3 | 0,19 | 0,0361 | 0,315539 |
| Clasa 4 | 0,11 | 0,0121 | 0,2428 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 8


### 1. Dependență de traiectorie — 0.5 p

O firmă a investit în utilaje dedicate unui singur produs; trecerea la produsele cerute acum presupune costuri mari de înlocuire. Ce proprietate CAS explică această limitare?


**Rezolvare**


Este dependență de traiectorie: deciziile anterioare restrâng opțiunile actuale. Investiția în utilaje specializate face schimbarea costisitoare. Trecutul condiționează evoluția, fără să facă schimbarea imposibilă.


**Barem de autoevaluare**


- 0.2 p: Numești dependența de traiectorie

- 0.15 p: legi investiția trecută de costul actual

- 0.15 p: explici restrângerea opțiunilor


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
2. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
3. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 75 | 55 |
| Clasa 2 | 15 | 25 |
| Clasa 3 | 10 | 20 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,182428.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,75 | 0,55 | 0,062031 |
| Clasa 2 | 0,15 | 0,25 | 0,051083 |
| Clasa 3 | 0,1 | 0,2 | 0,069315 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 55 |
| Clasa 2 | 25 |
| Clasa 3 | 20 |


**Rezolvare**


q = (0,55; 0,25; 0,2); n = 3.
HHI = Σq² = 0,405; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,1075.
H = −Σq ln(q) = 0,997272 nats; H normalizată = H/ln(n) = 0,907756.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,55 | 0,3025 | 0,32881 |
| Clasa 2 | 0,25 | 0,0625 | 0,346574 |
| Clasa 3 | 0,2 | 0,04 | 0,321888 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 9


### 1. Explorarea posibilităților — 0.5 p

O firmă testează în paralel trei ambalaje și două canale de vânzare, apoi păstrează combinațiile potrivite pieței. Ce proprietate CAS evidențiază această abordare?


**Rezolvare**


Este explorarea spațiului posibilităților. Firma încearcă mai multe micro-strategii în loc să presupună că există o soluție optimă permanent. Rezultatele experimentelor ajută la selectarea variantelor potrivite condițiilor actuale.


**Barem de autoevaluare**


- 0.2 p: Numești explorarea

- 0.15 p: identifici experimentele paralele

- 0.15 p: explici selectarea/adaptarea strategiilor


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
2. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
3. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 20 | 25 |
| Clasa 2 | 30 | 30 |
| Clasa 3 | 50 | 45 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,016425.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,2 | 0,25 | 0,011157 |
| Clasa 2 | 0,3 | 0,3 | 0 |
| Clasa 3 | 0,5 | 0,45 | 0,005268 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 25 |
| Clasa 2 | 30 |
| Clasa 3 | 45 |


**Rezolvare**


q = (0,25; 0,3; 0,45); n = 3.
HHI = Σq² = 0,355; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,0325.
H = −Σq ln(q) = 1,067094 nats; H normalizată = H/ln(n) = 0,971311.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,25 | 0,0625 | 0,346574 |
| Clasa 2 | 0,3 | 0,09 | 0,361192 |
| Clasa 3 | 0,45 | 0,2025 | 0,359328 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 10


### 1. Departe de echilibru — 0.5 p

În urma unei perturbări persistente a cererii, o firmă deschisă către piață își reorganizează continuu fluxurile și creează noi forme de colaborare. Explică funcționarea departe de echilibru.


**Rezolvare**


Firma funcționează în condiții care o îndepărtează de vechiul regim stabil. Schimburile cu mediul și perturbarea persistentă o determină să creeze noi structuri de colaborare. Departe de echilibru nu înseamnă automat faliment, ci posibilitatea reorganizării în condiții de schimbare.


**Barem de autoevaluare**


- 0.2 p: Identifici îndepărtarea de vechiul regim

- 0.15 p: menționezi schimburile cu mediul

- 0.15 p: explici apariția unor structuri noi


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
2. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
3. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 85 | 40 |
| Clasa 2 | 10 | 35 |
| Clasa 3 | 5 | 25 |


**Rezolvare**


Total bază = 100; total curent = 100. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,974276.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,85 | 0,4 | 0,339197 |
| Clasa 2 | 0,1 | 0,35 | 0,313191 |
| Clasa 3 | 0,05 | 0,25 | 0,321888 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 40 |
| Clasa 2 | 35 |
| Clasa 3 | 25 |


**Rezolvare**


q = (0,4; 0,35; 0,25); n = 3.
HHI = Σq² = 0,345; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,0175.
H = −Σq ln(q) = 1,080528 nats; H normalizată = H/ln(n) = 0,983539.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,4 | 0,16 | 0,366516 |
| Clasa 2 | 0,35 | 0,1225 | 0,367438 |
| Clasa 3 | 0,25 | 0,0625 | 0,346574 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 11


### 1. Istoricitate — 0.5 p

După o criză, o bancă păstrează proceduri de analiză învățate din pierderile trecute, deși mediul s-a schimbat. Ce proprietate evidențiază influența experienței asupra prezentului?


**Rezolvare**


Este istoricitate: starea prezentă păstrează urmele evoluției trecute. Procedurile curente au fost modelate de experiența crizei. Dacă aceste alegeri limitează și opțiunile viitoare, putem discuta și despre dependență de traiectorie.


**Barem de autoevaluare**


- 0.2 p: Numești istoricitatea

- 0.15 p: indici experiența trecută

- 0.15 p: explici influența asupra prezentului


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
2. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
3. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 102 | 96 |
| Clasa 2 | 60 | 64 |
| Clasa 3 | 40 | 42 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,003562.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,50495 | 0,475248 | 0,001801 |
| Clasa 2 | 0,29703 | 0,316832 | 0,001278 |
| Clasa 3 | 0,19802 | 0,207921 | 0,000483 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 96 |
| Clasa 2 | 64 |
| Clasa 3 | 42 |


**Rezolvare**


q = (0,475248; 0,316832; 0,207921); n = 3.
HHI = Σq² = 0,369474; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,05421.
H = −Σq ln(q) = 1,044267 nats; H normalizată = H/ln(n) = 0,950533.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,475248 | 0,22586 | 0,353546 |
| Clasa 2 | 0,316832 | 0,100382 | 0,364161 |
| Clasa 3 | 0,207921 | 0,043231 | 0,32656 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 12


### 1. Neliniaritate — 0.5 p

O creștere mică a comenzilor depășește capacitatea bucătăriei și produce o creștere foarte mare a timpului de așteptare. Identifică proprietatea și justifică.


**Rezolvare**


Este neliniaritate: efectul nu este proporțional cu schimbarea cauzei. O creștere mică a cererii trece peste pragul de capacitate și generează întârzieri disproporționate. Mărimea efectului și existența pragului sunt indiciile principale.


**Barem de autoevaluare**


- 0.2 p: Numești neliniaritatea

- 0.15 p: compari cauza mică cu efectul mare

- 0.15 p: explici pragul de capacitate


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
2. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
3. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 122 | 80 |
| Clasa 2 | 60 | 82 |
| Clasa 3 | 20 | 40 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,190391.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,60396 | 0,39604 | 0,087741 |
| Clasa 2 | 0,29703 | 0,405941 | 0,034021 |
| Clasa 3 | 0,09901 | 0,19802 | 0,068628 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 80 |
| Clasa 2 | 82 |
| Clasa 3 | 40 |


**Rezolvare**


q = (0,39604; 0,405941; 0,19802); n = 3.
HHI = Σq² = 0,360847; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,04127.
H = −Σq ln(q) = 1,053474 nats; H normalizată = H/ln(n) = 0,958914.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,39604 | 0,156847 | 0,366828 |
| Clasa 2 | 0,405941 | 0,164788 | 0,365975 |
| Clasa 3 | 0,19802 | 0,039212 | 0,320671 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 13


### 1. Conectivitate — 0.5 p

O platformă transmite în timp real comenzile între clienți, comercianți și curieri. Identifică proprietatea CAS evidențiată și explică indiciul.


**Rezolvare**


Este conectivitate: agenții sunt legați printr-o rețea de comunicare. Dovada este transmiterea comenzilor între clienți, comercianți și curieri. Aceste legături permit circulația informației și coordonarea acțiunilor.


**Barem de autoevaluare**


- 0.2 p: Numești conectivitatea

- 0.15 p: indici legăturile din text

- 0.15 p: explici circulația informației


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
2. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
3. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 142 | 70 |
| Clasa 2 | 40 | 72 |
| Clasa 3 | 20 | 60 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,56278.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,70297 | 0,346535 | 0,252118 |
| Clasa 2 | 0,19802 | 0,356436 | 0,093115 |
| Clasa 3 | 0,09901 | 0,29703 | 0,217547 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 70 |
| Clasa 2 | 72 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,346535; 0,356436; 0,29703); n = 3.
HHI = Σq² = 0,335359; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,003039.
H = −Σq ln(q) = 1,095519 nats; H normalizată = H/ln(n) = 0,997184.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,346535 | 0,120086 | 0,367248 |
| Clasa 2 | 0,356436 | 0,127046 | 0,3677 |
| Clasa 3 | 0,29703 | 0,088227 | 0,360571 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 14


### 1. Interdependență — 0.5 p

Un furnizor livrează făina cu întârziere; cofetăria amână producția, iar curierii își modifică livrările. Identifică proprietatea CAS și explică lanțul de influență.


**Rezolvare**


Este interdependență: funcționarea unui actor influențează funcționarea celorlalți. Întârzierea furnizorului schimbă producția și apoi livrarea. Nu este doar existența unei legături, ci transmiterea efectelor prin acea legătură.


**Barem de autoevaluare**


- 0.2 p: Numești interdependența

- 0.15 p: urmărești furnizor → producție → livrare

- 0.15 p: deosebești legătura de efect


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
2. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
3. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 62 | 180 |
| Clasa 2 | 60 | 12 |
| Clasa 3 | 80 | 10 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,725648.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,306931 | 0,891089 | 0,622609 |
| Clasa 2 | 0,29703 | 0,059406 | 0,382441 |
| Clasa 3 | 0,39604 | 0,049505 | 0,720599 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 180 |
| Clasa 2 | 12 |
| Clasa 3 | 10 |


**Rezolvare**


q = (0,891089; 0,059406; 0,049505); n = 3.
HHI = Σq² = 0,80002; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,700029.
H = −Σq ln(q) = 0,419273 nats; H normalizată = H/ln(n) = 0,381639.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,891089 | 0,79404 | 0,102752 |
| Clasa 2 | 0,059406 | 0,003529 | 0,167724 |
| Clasa 3 | 0,049505 | 0,002451 | 0,148796 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 15


### 1. Coevoluție — 0.5 p

O bancă lansează servicii digitale, concurentul introduce servicii mai rapide, iar prima bancă își îmbunătățește oferta ca răspuns. Identifică proprietatea și justifică.


**Rezolvare**


Este coevoluție exogenă, deoarece două organizații se adaptează reciproc. Oferta primei bănci schimbă decizia concurentului, iar răspunsul acestuia determină o nouă schimbare la prima bancă. Evoluția fiecăreia modifică mediul celeilalte.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: identifici cele două sensuri ale influenței

- 0.15 p: explici adaptarea reciprocă


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
2. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
3. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 70 | 120 |
| Clasa 2 | 66 | 52 |
| Clasa 3 | 66 | 30 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,290456.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,346535 | 0,594059 | 0,133415 |
| Clasa 2 | 0,326733 | 0,257426 | 0,016524 |
| Clasa 3 | 0,326733 | 0,148515 | 0,140517 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 52 |
| Clasa 3 | 30 |


**Rezolvare**


q = (0,594059; 0,257426; 0,148515); n = 3.
HHI = Σq² = 0,441231; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,161847.
H = −Σq ln(q) = 0,941933 nats; H normalizată = H/ln(n) = 0,857384.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,594059 | 0,352907 | 0,309372 |
| Clasa 2 | 0,257426 | 0,066268 | 0,349333 |
| Clasa 3 | 0,148515 | 0,022057 | 0,283228 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 16


### 1. Auto-organizare — 0.5 p

Într-un depozit, angajații își redistribuie spontan sarcinile când apare aglomerație, fără instrucțiuni de la manager. Identifică proprietatea și dovada.


**Rezolvare**


Este auto-organizare: ordinea apare din interacțiunile locale ale angajaților. Dovada este redistribuirea spontană, fără comandă centrală. Echipa își reorganizează activitatea pentru a răspunde situației.


**Barem de autoevaluare**


- 0.2 p: Numești auto-organizarea

- 0.15 p: observi lipsa comenzii centrale

- 0.15 p: explici ordinea apărută local


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
2. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
3. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 52 | 130 |
| Clasa 2 | 50 | 32 |
| Clasa 3 | 50 | 20 |
| Clasa 4 | 50 | 20 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,665749.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,257426 | 0,643564 | 0,353815 |
| Clasa 2 | 0,247525 | 0,158416 | 0,039768 |
| Clasa 3 | 0,247525 | 0,09901 | 0,136083 |
| Clasa 4 | 0,247525 | 0,09901 | 0,136083 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 130 |
| Clasa 2 | 32 |
| Clasa 3 | 20 |
| Clasa 4 | 20 |


**Rezolvare**


q = (0,643564; 0,158416; 0,09901; 0,09901); n = 4.
HHI = Σq² = 0,458877; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,278502.
H = −Σq ln(q) = 1,033454 nats; H normalizată = H/ln(n) = 0,74548.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,643564 | 0,414175 | 0,28364 |
| Clasa 2 | 0,158416 | 0,025096 | 0,291886 |
| Clasa 3 | 0,09901 | 0,009803 | 0,228964 |
| Clasa 4 | 0,09901 | 0,009803 | 0,228964 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 17


### 1. Emergență — 0.5 p

Mulți clienți își retrag separat economiile, iar retragerile cumulate produc o criză de lichiditate a băncii. Distinge acțiunea individuală de fenomenul emergent.


**Rezolvare**


Acțiunea individuală este retragerea banilor de către un client. Fenomenul emergent este criza de lichiditate la nivelul băncii, apărută prin cumularea și interacțiunea comportamentelor clienților. Criza este o stare a sistemului, nu acțiunea unui singur client.


**Barem de autoevaluare**


- 0.2 p: Numești emergența

- 0.15 p: identifici retragerea individuală

- 0.15 p: identifici criza la nivelul sistemului


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
2. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
3. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 82 | 76 |
| Clasa 2 | 60 | 66 |
| Clasa 3 | 40 | 38 |
| Clasa 4 | 20 | 22 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,00654.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,405941 | 0,376238 | 0,002257 |
| Clasa 2 | 0,29703 | 0,326733 | 0,002831 |
| Clasa 3 | 0,19802 | 0,188119 | 0,000508 |
| Clasa 4 | 0,09901 | 0,108911 | 0,000944 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 76 |
| Clasa 2 | 66 |
| Clasa 3 | 38 |
| Clasa 4 | 22 |


**Rezolvare**


q = (0,376238; 0,326733; 0,188119; 0,108911); n = 4.
HHI = Σq² = 0,295559; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,060746.
H = −Σq ln(q) = 1,289039 nats; H normalizată = H/ln(n) = 0,929845.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,376238 | 0,141555 | 0,367785 |
| Clasa 2 | 0,326733 | 0,106754 | 0,365487 |
| Clasa 3 | 0,188119 | 0,035389 | 0,314287 |
| Clasa 4 | 0,108911 | 0,011862 | 0,24148 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 18


### 1. Feedback pozitiv — 0.5 p

Un zvon provoacă retrageri, retragerile reduc lichiditatea și sporesc teama, iar teama determină alte retrageri. Identifică feedbackul și explică bucla.


**Rezolvare**


Feedbackul este pozitiv, fiindcă amplifică schimbarea inițială. Retragerile reduc lichiditatea, ceea ce mărește teama și produce noi retrageri. Pozitiv înseamnă amplificator, nu benefic pentru bancă.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul pozitiv

- 0.15 p: închizi bucla retrageri → teamă → retrageri

- 0.15 p: explici amplificarea


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
2. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
3. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 152 | 110 |
| Clasa 2 | 30 | 52 |
| Clasa 3 | 20 | 40 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,195776.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,752475 | 0,544554 | 0,067242 |
| Clasa 2 | 0,148515 | 0,257426 | 0,059906 |
| Clasa 3 | 0,09901 | 0,19802 | 0,068628 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 110 |
| Clasa 2 | 52 |
| Clasa 3 | 40 |


**Rezolvare**


q = (0,544554; 0,257426; 0,19802); n = 3.
HHI = Σq² = 0,402019; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,103029.
H = −Σq ln(q) = 1,000977 nats; H normalizată = H/ln(n) = 0,911129.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,544554 | 0,29654 | 0,330973 |
| Clasa 2 | 0,257426 | 0,066268 | 0,349333 |
| Clasa 3 | 0,19802 | 0,039212 | 0,320671 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 19


### 1. Feedback negativ — 0.5 p

Creșterea întârzierilor la livrare determină suplimentarea temporară a personalului; întârzierile scad spre ținta stabilită. Identifică feedbackul și explică.


**Rezolvare**


Feedbackul este negativ: reacția reduce abaterea față de ținta de livrare. Întârzierile declanșează suplimentarea personalului, care le diminuează. Negativ descrie efectul corectiv al buclei, nu o consecință nedorită.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul negativ

- 0.15 p: identifici abaterea și reacția

- 0.15 p: explici reducerea abaterii


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
2. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
3. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 42 | 50 |
| Clasa 2 | 60 | 62 |
| Clasa 3 | 100 | 90 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,012446.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,207921 | 0,247525 | 0,006905 |
| Clasa 2 | 0,29703 | 0,306931 | 0,000325 |
| Clasa 3 | 0,49505 | 0,445545 | 0,005216 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 50 |
| Clasa 2 | 62 |
| Clasa 3 | 90 |


**Rezolvare**


q = (0,247525; 0,306931; 0,445545); n = 3.
HHI = Σq² = 0,353985; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,030977.
H = −Σq ln(q) = 1,068335 nats; H normalizată = H/ln(n) = 0,972441.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,247525 | 0,061269 | 0,345605 |
| Clasa 2 | 0,306931 | 0,094206 | 0,362526 |
| Clasa 3 | 0,445545 | 0,19851 | 0,360204 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 20


### 1. Dependență de traiectorie — 0.5 p

O firmă a investit în utilaje dedicate unui singur produs; trecerea la produsele cerute acum presupune costuri mari de înlocuire. Ce proprietate CAS explică această limitare?


**Rezolvare**


Este dependență de traiectorie: deciziile anterioare restrâng opțiunile actuale. Investiția în utilaje specializate face schimbarea costisitoare. Trecutul condiționează evoluția, fără să facă schimbarea imposibilă.


**Barem de autoevaluare**


- 0.2 p: Numești dependența de traiectorie

- 0.15 p: legi investiția trecută de costul actual

- 0.15 p: explici restrângerea opțiunilor


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
2. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
3. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 172 | 80 |
| Clasa 2 | 20 | 72 |
| Clasa 3 | 10 | 50 |


**Rezolvare**


Total bază = 202; total curent = 202. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,997075.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,851485 | 0,39604 | 0,348629 |
| Clasa 2 | 0,09901 | 0,356436 | 0,329745 |
| Clasa 3 | 0,049505 | 0,247525 | 0,318701 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 80 |
| Clasa 2 | 72 |
| Clasa 3 | 50 |


**Rezolvare**


q = (0,39604; 0,356436; 0,247525); n = 3.
HHI = Σq² = 0,345162; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,017743.
H = −Σq ln(q) = 1,080133 nats; H normalizată = H/ln(n) = 0,983179.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,39604 | 0,156847 | 0,366828 |
| Clasa 2 | 0,356436 | 0,127046 | 0,3677 |
| Clasa 3 | 0,247525 | 0,061269 | 0,345605 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 21


### 1. Explorarea posibilităților — 0.5 p

O firmă testează în paralel trei ambalaje și două canale de vânzare, apoi păstrează combinațiile potrivite pieței. Ce proprietate CAS evidențiază această abordare?


**Rezolvare**


Este explorarea spațiului posibilităților. Firma încearcă mai multe micro-strategii în loc să presupună că există o soluție optimă permanent. Rezultatele experimentelor ajută la selectarea variantelor potrivite condițiilor actuale.


**Barem de autoevaluare**


- 0.2 p: Numești explorarea

- 0.15 p: identifici experimentele paralele

- 0.15 p: explici selectarea/adaptarea strategiilor


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
2. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
3. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 52 | 144 |
| Clasa 2 | 30 | 99 |
| Clasa 3 | 20 | 63 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,006421.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,509804 | 0,470588 | 0,003139 |
| Clasa 2 | 0,294118 | 0,323529 | 0,002803 |
| Clasa 3 | 0,196078 | 0,205882 | 0,000478 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 144 |
| Clasa 2 | 99 |
| Clasa 3 | 63 |


**Rezolvare**


q = (0,470588; 0,323529; 0,205882); n = 3.
HHI = Σq² = 0,368512; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,052768.
H = −Σq ln(q) = 1,045195 nats; H normalizată = H/ln(n) = 0,951377.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,470588 | 0,221453 | 0,354716 |
| Clasa 2 | 0,323529 | 0,104671 | 0,365092 |
| Clasa 3 | 0,205882 | 0,042388 | 0,325387 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 22


### 1. Departe de echilibru — 0.5 p

În urma unei perturbări persistente a cererii, o firmă deschisă către piață își reorganizează continuu fluxurile și creează noi forme de colaborare. Explică funcționarea departe de echilibru.


**Rezolvare**


Firma funcționează în condiții care o îndepărtează de vechiul regim stabil. Schimburile cu mediul și perturbarea persistentă o determină să creeze noi structuri de colaborare. Departe de echilibru nu înseamnă automat faliment, ci posibilitatea reorganizării în condiții de schimbare.


**Barem de autoevaluare**


- 0.2 p: Identifici îndepărtarea de vechiul regim

- 0.15 p: menționezi schimburile cu mediul

- 0.15 p: explici apariția unor structuri noi


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
2. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
3. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 62 | 120 |
| Clasa 2 | 30 | 126 |
| Clasa 3 | 10 | 60 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,202066.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,607843 | 0,392157 | 0,094526 |
| Clasa 2 | 0,294118 | 0,411765 | 0,039585 |
| Clasa 3 | 0,098039 | 0,196078 | 0,067956 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 126 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,392157; 0,411765; 0,196078); n = 3.
HHI = Σq² = 0,361784; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,042676.
H = −Σq ln(q) = 1,051915 nats; H normalizată = H/ln(n) = 0,957494.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,392157 | 0,153787 | 0,367095 |
| Clasa 2 | 0,411765 | 0,16955 | 0,36536 |
| Clasa 3 | 0,196078 | 0,038447 | 0,319459 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 23


### 1. Istoricitate — 0.5 p

După o criză, o bancă păstrează proceduri de analiză învățate din pierderile trecute, deși mediul s-a schimbat. Ce proprietate evidențiază influența experienței asupra prezentului?


**Rezolvare**


Este istoricitate: starea prezentă păstrează urmele evoluției trecute. Procedurile curente au fost modelate de experiența crizei. Dacă aceste alegeri limitează și opțiunile viitoare, putem discuta și despre dependență de traiectorie.


**Barem de autoevaluare**


- 0.2 p: Numești istoricitatea

- 0.15 p: indici experiența trecută

- 0.15 p: explici influența asupra prezentului


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
2. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
3. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 72 | 105 |
| Clasa 2 | 20 | 111 |
| Clasa 3 | 10 | 90 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,5796.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,705882 | 0,343137 | 0,261655 |
| Clasa 2 | 0,196078 | 0,362745 | 0,102531 |
| Clasa 3 | 0,098039 | 0,294118 | 0,215414 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 105 |
| Clasa 2 | 111 |
| Clasa 3 | 90 |


**Rezolvare**


q = (0,343137; 0,362745; 0,294118); n = 3.
HHI = Σq² = 0,335832; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,003749.
H = −Σq ln(q) = 1,094805 nats; H normalizată = H/ln(n) = 0,996535.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,343137 | 0,117743 | 0,367028 |
| Clasa 2 | 0,362745 | 0,131584 | 0,367843 |
| Clasa 3 | 0,294118 | 0,086505 | 0,359934 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 24


### 1. Neliniaritate — 0.5 p

O creștere mică a comenzilor depășește capacitatea bucătăriei și produce o creștere foarte mare a timpului de așteptare. Identifică proprietatea și justifică.


**Rezolvare**


Este neliniaritate: efectul nu este proporțional cu schimbarea cauzei. O creștere mică a cererii trece peste pragul de capacitate și generează întârzieri disproporționate. Mărimea efectului și existența pragului sunt indiciile principale.


**Barem de autoevaluare**


- 0.2 p: Numești neliniaritatea

- 0.15 p: compari cauza mică cu efectul mare

- 0.15 p: explici pragul de capacitate


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
2. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
3. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 32 | 270 |
| Clasa 2 | 30 | 21 |
| Clasa 3 | 40 | 15 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,62969.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,313725 | 0,882353 | 0,588003 |
| Clasa 2 | 0,294118 | 0,068627 | 0,328153 |
| Clasa 3 | 0,392157 | 0,04902 | 0,713534 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 270 |
| Clasa 2 | 21 |
| Clasa 3 | 15 |


**Rezolvare**


q = (0,882353; 0,068627; 0,04902); n = 3.
HHI = Σq² = 0,785659; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,678489.
H = −Σq ln(q) = 0,442116 nats; H normalizată = H/ln(n) = 0,402431.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,882353 | 0,778547 | 0,110438 |
| Clasa 2 | 0,068627 | 0,00471 | 0,183857 |
| Clasa 3 | 0,04902 | 0,002403 | 0,14782 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 25


### 1. Conectivitate — 0.5 p

O platformă transmite în timp real comenzile între clienți, comercianți și curieri. Identifică proprietatea CAS evidențiată și explică indiciul.


**Rezolvare**


Este conectivitate: agenții sunt legați printr-o rețea de comunicare. Dovada este transmiterea comenzilor între clienți, comercianți și curieri. Aceste legături permit circulația informației și coordonarea acțiunilor.


**Barem de autoevaluare**


- 0.2 p: Numești conectivitatea

- 0.15 p: indici legăturile din text

- 0.15 p: explici circulația informației


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
2. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
3. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 36 | 180 |
| Clasa 2 | 33 | 81 |
| Clasa 3 | 33 | 45 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,271138.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,352941 | 0,588235 | 0,120194 |
| Clasa 2 | 0,323529 | 0,264706 | 0,011804 |
| Clasa 3 | 0,323529 | 0,147059 | 0,13914 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 180 |
| Clasa 2 | 81 |
| Clasa 3 | 45 |


**Rezolvare**


q = (0,588235; 0,264706; 0,147059); n = 3.
HHI = Σq² = 0,437716; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,156574.
H = −Σq ln(q) = 0,945865 nats; H normalizată = H/ln(n) = 0,860963.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,588235 | 0,346021 | 0,312134 |
| Clasa 2 | 0,264706 | 0,070069 | 0,35183 |
| Clasa 3 | 0,147059 | 0,021626 | 0,2819 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 26


### 1. Interdependență — 0.5 p

Un furnizor livrează făina cu întârziere; cofetăria amână producția, iar curierii își modifică livrările. Identifică proprietatea CAS și explică lanțul de influență.


**Rezolvare**


Este interdependență: funcționarea unui actor influențează funcționarea celorlalți. Întârzierea furnizorului schimbă producția și apoi livrarea. Nu este doar existența unei legături, ci transmiterea efectelor prin acea legătură.


**Barem de autoevaluare**


- 0.2 p: Numești interdependența

- 0.15 p: urmărești furnizor → producție → livrare

- 0.15 p: deosebești legătura de efect


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
2. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
3. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 27 | 195 |
| Clasa 2 | 25 | 51 |
| Clasa 3 | 25 | 30 |
| Clasa 4 | 25 | 30 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,627048.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,264706 | 0,637255 | 0,327303 |
| Clasa 2 | 0,245098 | 0,166667 | 0,030248 |
| Clasa 3 | 0,245098 | 0,098039 | 0,134749 |
| Clasa 4 | 0,245098 | 0,098039 | 0,134749 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 195 |
| Clasa 2 | 51 |
| Clasa 3 | 30 |
| Clasa 4 | 30 |


**Rezolvare**


q = (0,637255; 0,166667; 0,098039; 0,098039); n = 4.
HHI = Σq² = 0,453095; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,270793.
H = −Σq ln(q) = 1,041135 nats; H normalizată = H/ln(n) = 0,75102.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,637255 | 0,406094 | 0,287138 |
| Clasa 2 | 0,166667 | 0,027778 | 0,298627 |
| Clasa 3 | 0,098039 | 0,009612 | 0,227685 |
| Clasa 4 | 0,098039 | 0,009612 | 0,227685 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 27


### 1. Coevoluție — 0.5 p

O bancă lansează servicii digitale, concurentul introduce servicii mai rapide, iar prima bancă își îmbunătățește oferta ca răspuns. Identifică proprietatea și justifică.


**Rezolvare**


Este coevoluție exogenă, deoarece două organizații se adaptează reciproc. Oferta primei bănci schimbă decizia concurentului, iar răspunsul acestuia determină o nouă schimbare la prima bancă. Evoluția fiecăreia modifică mediul celeilalte.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: identifici cele două sensuri ale influenței

- 0.15 p: explici adaptarea reciprocă


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
2. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
3. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 42 | 114 |
| Clasa 2 | 30 | 102 |
| Clasa 3 | 20 | 57 |
| Clasa 4 | 10 | 33 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,01027.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,411765 | 0,372549 | 0,003925 |
| Clasa 2 | 0,294118 | 0,333333 | 0,004908 |
| Clasa 3 | 0,196078 | 0,186275 | 0,000503 |
| Clasa 4 | 0,098039 | 0,107843 | 0,000934 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 114 |
| Clasa 2 | 102 |
| Clasa 3 | 57 |
| Clasa 4 | 33 |


**Rezolvare**


q = (0,372549; 0,333333; 0,186275; 0,107843); n = 4.
HHI = Σq² = 0,296232; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,061643.
H = −Σq ln(q) = 1,28727 nats; H normalizată = H/ln(n) = 0,928569.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,372549 | 0,138793 | 0,36785 |
| Clasa 2 | 0,333333 | 0,111111 | 0,366204 |
| Clasa 3 | 0,186275 | 0,034698 | 0,313041 |
| Clasa 4 | 0,107843 | 0,01163 | 0,240175 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 28


### 1. Auto-organizare — 0.5 p

Într-un depozit, angajații își redistribuie spontan sarcinile când apare aglomerație, fără instrucțiuni de la manager. Identifică proprietatea și dovada.


**Rezolvare**


Este auto-organizare: ordinea apare din interacțiunile locale ale angajaților. Dovada este redistribuirea spontană, fără comandă centrală. Echipa își reorganizează activitatea pentru a răspunde situației.


**Barem de autoevaluare**


- 0.2 p: Numești auto-organizarea

- 0.15 p: observi lipsa comenzii centrale

- 0.15 p: explici ordinea apărută local


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
2. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
3. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 77 | 165 |
| Clasa 2 | 15 | 81 |
| Clasa 3 | 10 | 60 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,209679.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,754902 | 0,539216 | 0,072572 |
| Clasa 2 | 0,147059 | 0,264706 | 0,069151 |
| Clasa 3 | 0,098039 | 0,196078 | 0,067956 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 165 |
| Clasa 2 | 81 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,539216; 0,264706; 0,196078); n = 3.
HHI = Σq² = 0,39927; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,098904.
H = −Σq ln(q) = 1,00433 nats; H normalizată = H/ln(n) = 0,914181.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,539216 | 0,290754 | 0,333041 |
| Clasa 2 | 0,264706 | 0,070069 | 0,35183 |
| Clasa 3 | 0,196078 | 0,038447 | 0,319459 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 29


### 1. Emergență — 0.5 p

Mulți clienți își retrag separat economiile, iar retragerile cumulate produc o criză de lichiditate a băncii. Distinge acțiunea individuală de fenomenul emergent.


**Rezolvare**


Acțiunea individuală este retragerea banilor de către un client. Fenomenul emergent este criza de lichiditate la nivelul băncii, apărută prin cumularea și interacțiunea comportamentelor clienților. Criza este o stare a sistemului, nu acțiunea unui singur client.


**Barem de autoevaluare**


- 0.2 p: Numești emergența

- 0.15 p: identifici retragerea individuală

- 0.15 p: identifici criza la nivelul sistemului


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
2. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
3. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 22 | 75 |
| Clasa 2 | 30 | 96 |
| Clasa 3 | 50 | 135 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,01019.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,215686 | 0,245098 | 0,00376 |
| Clasa 2 | 0,294118 | 0,313725 | 0,001265 |
| Clasa 3 | 0,490196 | 0,441176 | 0,005165 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 75 |
| Clasa 2 | 96 |
| Clasa 3 | 135 |


**Rezolvare**


q = (0,245098; 0,313725; 0,441176); n = 3.
HHI = Σq² = 0,353133; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,0297.
H = −Σq ln(q) = 1,069333 nats; H normalizată = H/ln(n) = 0,973349.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,245098 | 0,060073 | 0,344632 |
| Clasa 2 | 0,313725 | 0,098424 | 0,363682 |
| Clasa 3 | 0,441176 | 0,194637 | 0,361019 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 30


### 1. Feedback pozitiv — 0.5 p

Un zvon provoacă retrageri, retragerile reduc lichiditatea și sporesc teama, iar teama determină alte retrageri. Identifică feedbackul și explică bucla.


**Rezolvare**


Feedbackul este pozitiv, fiindcă amplifică schimbarea inițială. Retragerile reduc lichiditatea, ceea ce mărește teama și produce noi retrageri. Pozitiv înseamnă amplificator, nu benefic pentru bancă.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul pozitiv

- 0.15 p: închizi bucla retrageri → teamă → retrageri

- 0.15 p: explici amplificarea


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
2. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
3. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 87 | 120 |
| Clasa 2 | 10 | 111 |
| Clasa 3 | 5 | 75 |


**Rezolvare**


Total bază = 102; total curent = 306. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,019942.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,852941 | 0,392157 | 0,358043 |
| Clasa 2 | 0,098039 | 0,362745 | 0,346323 |
| Clasa 3 | 0,04902 | 0,245098 | 0,315576 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 111 |
| Clasa 3 | 75 |


**Rezolvare**


q = (0,392157; 0,362745; 0,245098); n = 3.
HHI = Σq² = 0,345444; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,018166.
H = −Σq ln(q) = 1,07957 nats; H normalizată = H/ln(n) = 0,982667.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,392157 | 0,153787 | 0,367095 |
| Clasa 2 | 0,362745 | 0,131584 | 0,367843 |
| Clasa 3 | 0,245098 | 0,060073 | 0,344632 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 31


### 1. Feedback negativ — 0.5 p

Creșterea întârzierilor la livrare determină suplimentarea temporară a personalului; întârzierile scad spre ținta stabilită. Identifică feedbackul și explică.


**Rezolvare**


Feedbackul este negativ: reacția reduce abaterea față de ținta de livrare. Întârzierile declanșează suplimentarea personalului, care le diminuează. Negativ descrie efectul corectiv al buclei, nu o consecință nedorită.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul negativ

- 0.15 p: identifici abaterea și reacția

- 0.15 p: explici reducerea abaterii


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
2. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
3. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 106 | 48 |
| Clasa 2 | 60 | 34 |
| Clasa 3 | 40 | 21 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,010145.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,514563 | 0,466019 | 0,00481 |
| Clasa 2 | 0,291262 | 0,330097 | 0,004861 |
| Clasa 3 | 0,194175 | 0,203883 | 0,000474 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 48 |
| Clasa 2 | 34 |
| Clasa 3 | 21 |


**Rezolvare**


q = (0,466019; 0,330097; 0,203883); n = 3.
HHI = Σq² = 0,367707; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,05156.
H = −Σq ln(q) = 1,045905 nats; H normalizată = H/ln(n) = 0,952024.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,466019 | 0,217174 | 0,355819 |
| Clasa 2 | 0,330097 | 0,108964 | 0,365869 |
| Clasa 3 | 0,203883 | 0,041568 | 0,324217 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 32


### 1. Dependență de traiectorie — 0.5 p

O firmă a investit în utilaje dedicate unui singur produs; trecerea la produsele cerute acum presupune costuri mari de înlocuire. Ce proprietate CAS explică această limitare?


**Rezolvare**


Este dependență de traiectorie: deciziile anterioare restrâng opțiunile actuale. Investiția în utilaje specializate face schimbarea costisitoare. Trecutul condiționează evoluția, fără să facă schimbarea imposibilă.


**Barem de autoevaluare**


- 0.2 p: Numești dependența de traiectorie

- 0.15 p: legi investiția trecută de costul actual

- 0.15 p: explici restrângerea opțiunilor


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
2. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
3. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 126 | 40 |
| Clasa 2 | 60 | 43 |
| Clasa 3 | 20 | 20 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,214169.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,61165 | 0,38835 | 0,101436 |
| Clasa 2 | 0,291262 | 0,417476 | 0,045437 |
| Clasa 3 | 0,097087 | 0,194175 | 0,067296 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 40 |
| Clasa 2 | 43 |
| Clasa 3 | 20 |


**Rezolvare**


q = (0,38835; 0,417476; 0,194175); n = 3.
HHI = Σq² = 0,362805; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,044208.
H = −Σq ln(q) = 1,050249 nats; H normalizată = H/ln(n) = 0,955978.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,38835 | 0,150815 | 0,36732 |
| Clasa 2 | 0,417476 | 0,174286 | 0,364677 |
| Clasa 3 | 0,194175 | 0,037704 | 0,318252 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 33


### 1. Explorarea posibilităților — 0.5 p

O firmă testează în paralel trei ambalaje și două canale de vânzare, apoi păstrează combinațiile potrivite pieței. Ce proprietate CAS evidențiază această abordare?


**Rezolvare**


Este explorarea spațiului posibilităților. Firma încearcă mai multe micro-strategii în loc să presupună că există o soluție optimă permanent. Rezultatele experimentelor ajută la selectarea variantelor potrivite condițiilor actuale.


**Barem de autoevaluare**


- 0.2 p: Numești explorarea

- 0.15 p: identifici experimentele paralele

- 0.15 p: explici selectarea/adaptarea strategiilor


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
2. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
3. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 146 | 35 |
| Clasa 2 | 40 | 38 |
| Clasa 3 | 20 | 30 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,596698.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,708738 | 0,339806 | 0,271206 |
| Clasa 2 | 0,194175 | 0,368932 | 0,112169 |
| Clasa 3 | 0,097087 | 0,291262 | 0,213323 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 35 |
| Clasa 2 | 38 |
| Clasa 3 | 30 |


**Rezolvare**


q = (0,339806; 0,368932; 0,291262); n = 3.
HHI = Σq² = 0,336412; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,004619.
H = −Σq ln(q) = 1,093939 nats; H normalizată = H/ln(n) = 0,995746.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,339806 | 0,115468 | 0,36678 |
| Clasa 2 | 0,368932 | 0,136111 | 0,367878 |
| Clasa 3 | 0,291262 | 0,084834 | 0,359281 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 34


### 1. Departe de echilibru — 0.5 p

În urma unei perturbări persistente a cererii, o firmă deschisă către piață își reorganizează continuu fluxurile și creează noi forme de colaborare. Explică funcționarea departe de echilibru.


**Rezolvare**


Firma funcționează în condiții care o îndepărtează de vechiul regim stabil. Schimburile cu mediul și perturbarea persistentă o determină să creeze noi structuri de colaborare. Departe de echilibru nu înseamnă automat faliment, ci posibilitatea reorganizării în condiții de schimbare.


**Barem de autoevaluare**


- 0.2 p: Identifici îndepărtarea de vechiul regim

- 0.15 p: menționezi schimburile cu mediul

- 0.15 p: explici apariția unor structuri noi


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
2. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
3. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 66 | 90 |
| Clasa 2 | 60 | 8 |
| Clasa 3 | 80 | 5 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,544149.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,320388 | 0,873786 | 0,555225 |
| Clasa 2 | 0,291262 | 0,07767 | 0,282317 |
| Clasa 3 | 0,38835 | 0,048544 | 0,706606 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 90 |
| Clasa 2 | 8 |
| Clasa 3 | 5 |


**Rezolvare**


q = (0,873786; 0,07767; 0,048544); n = 3.
HHI = Σq² = 0,771892; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,657838.
H = −Σq ln(q) = 0,463218 nats; H normalizată = H/ln(n) = 0,42164.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,873786 | 0,763503 | 0,117891 |
| Clasa 2 | 0,07767 | 0,006033 | 0,198469 |
| Clasa 3 | 0,048544 | 0,002356 | 0,146859 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 35


### 1. Istoricitate — 0.5 p

După o criză, o bancă păstrează proceduri de analiză învățate din pierderile trecute, deși mediul s-a schimbat. Ce proprietate evidențiază influența experienței asupra prezentului?


**Rezolvare**


Este istoricitate: starea prezentă păstrează urmele evoluției trecute. Procedurile curente au fost modelate de experiența crizei. Dacă aceste alegeri limitează și opțiunile viitoare, putem discuta și despre dependență de traiectorie.


**Barem de autoevaluare**


- 0.2 p: Numești istoricitatea

- 0.15 p: indici experiența trecută

- 0.15 p: explici influența asupra prezentului


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
2. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
3. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 74 | 60 |
| Clasa 2 | 66 | 28 |
| Clasa 3 | 66 | 15 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,253714.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,359223 | 0,582524 | 0,10795 |
| Clasa 2 | 0,320388 | 0,271845 | 0,007976 |
| Clasa 3 | 0,320388 | 0,145631 | 0,137789 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 60 |
| Clasa 2 | 28 |
| Clasa 3 | 15 |


**Rezolvare**


q = (0,582524; 0,271845; 0,145631); n = 3.
HHI = Σq² = 0,434442; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,151664.
H = −Σq ln(q) = 0,949456 nats; H normalizată = H/ln(n) = 0,864232.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,582524 | 0,339335 | 0,314787 |
| Clasa 2 | 0,271845 | 0,0739 | 0,354084 |
| Clasa 3 | 0,145631 | 0,021208 | 0,280584 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 36


### 1. Neliniaritate — 0.5 p

O creștere mică a comenzilor depășește capacitatea bucătăriei și produce o creștere foarte mare a timpului de așteptare. Identifică proprietatea și justifică.


**Rezolvare**


Este neliniaritate: efectul nu este proporțional cu schimbarea cauzei. O creștere mică a cererii trece peste pragul de capacitate și generează întârzieri disproporționate. Mărimea efectului și existența pragului sunt indiciile principale.


**Barem de autoevaluare**


- 0.2 p: Numești neliniaritatea

- 0.15 p: compari cauza mică cu efectul mare

- 0.15 p: explici pragul de capacitate


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
2. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
3. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 56 | 65 |
| Clasa 2 | 50 | 18 |
| Clasa 3 | 50 | 10 |
| Clasa 4 | 50 | 10 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,591738.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,271845 | 0,631068 | 0,302532 |
| Clasa 2 | 0,242718 | 0,174757 | 0,022326 |
| Clasa 3 | 0,242718 | 0,097087 | 0,13344 |
| Clasa 4 | 0,242718 | 0,097087 | 0,13344 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 65 |
| Clasa 2 | 18 |
| Clasa 3 | 10 |
| Clasa 4 | 10 |


**Rezolvare**


q = (0,631068; 0,174757; 0,097087; 0,097087); n = 4.
HHI = Σq² = 0,447639; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,263518.
H = −Σq ln(q) = 1,04819 nats; H normalizată = H/ln(n) = 0,756109.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,631068 | 0,398247 | 0,290507 |
| Clasa 2 | 0,174757 | 0,03054 | 0,304839 |
| Clasa 3 | 0,097087 | 0,009426 | 0,226422 |
| Clasa 4 | 0,097087 | 0,009426 | 0,226422 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 37


### 1. Conectivitate — 0.5 p

O platformă transmite în timp real comenzile între clienți, comercianți și curieri. Identifică proprietatea CAS evidențiată și explică indiciul.


**Rezolvare**


Este conectivitate: agenții sunt legați printr-o rețea de comunicare. Dovada este transmiterea comenzilor între clienți, comercianți și curieri. Aceste legături permit circulația informației și coordonarea acțiunilor.


**Barem de autoevaluare**


- 0.2 p: Numești conectivitatea

- 0.15 p: indici legăturile din text

- 0.15 p: explici circulația informației


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
2. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
3. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 86 | 38 |
| Clasa 2 | 60 | 35 |
| Clasa 3 | 40 | 19 |
| Clasa 4 | 20 | 11 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,014907.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,417476 | 0,368932 | 0,006001 |
| Clasa 2 | 0,291262 | 0,339806 | 0,007483 |
| Clasa 3 | 0,194175 | 0,184466 | 0,000498 |
| Clasa 4 | 0,097087 | 0,106796 | 0,000925 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 38 |
| Clasa 2 | 35 |
| Clasa 3 | 19 |
| Clasa 4 | 11 |


**Rezolvare**


q = (0,368932; 0,339806; 0,184466; 0,106796); n = 4.
HHI = Σq² = 0,297012; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,062683.
H = −Σq ln(q) = 1,285344 nats; H normalizată = H/ln(n) = 0,92718.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,368932 | 0,136111 | 0,367878 |
| Clasa 2 | 0,339806 | 0,115468 | 0,36678 |
| Clasa 3 | 0,184466 | 0,034028 | 0,311801 |
| Clasa 4 | 0,106796 | 0,011405 | 0,238885 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 38


### 1. Interdependență — 0.5 p

Un furnizor livrează făina cu întârziere; cofetăria amână producția, iar curierii își modifică livrările. Identifică proprietatea CAS și explică lanțul de influență.


**Rezolvare**


Este interdependență: funcționarea unui actor influențează funcționarea celorlalți. Întârzierea furnizorului schimbă producția și apoi livrarea. Nu este doar existența unei legături, ci transmiterea efectelor prin acea legătură.


**Barem de autoevaluare**


- 0.2 p: Numești interdependența

- 0.15 p: urmărești furnizor → producție → livrare

- 0.15 p: deosebești legătura de efect


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
2. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
3. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 156 | 55 |
| Clasa 2 | 30 | 28 |
| Clasa 3 | 20 | 20 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,224089.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,757282 | 0,533981 | 0,078016 |
| Clasa 2 | 0,145631 | 0,271845 | 0,078777 |
| Clasa 3 | 0,097087 | 0,194175 | 0,067296 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 55 |
| Clasa 2 | 28 |
| Clasa 3 | 20 |


**Rezolvare**


q = (0,533981; 0,271845; 0,194175); n = 3.
HHI = Σq² = 0,396739; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,095108.
H = −Σq ln(q) = 1,007353 nats; H normalizată = H/ln(n) = 0,916932.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,533981 | 0,285135 | 0,335017 |
| Clasa 2 | 0,271845 | 0,0739 | 0,354084 |
| Clasa 3 | 0,194175 | 0,037704 | 0,318252 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 39


### 1. Coevoluție — 0.5 p

O bancă lansează servicii digitale, concurentul introduce servicii mai rapide, iar prima bancă își îmbunătățește oferta ca răspuns. Identifică proprietatea și justifică.


**Rezolvare**


Este coevoluție exogenă, deoarece două organizații se adaptează reciproc. Oferta primei bănci schimbă decizia concurentului, iar răspunsul acestuia determină o nouă schimbare la prima bancă. Evoluția fiecăreia modifică mediul celeilalte.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: identifici cele două sensuri ale influenței

- 0.15 p: explici adaptarea reciprocă


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
2. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
3. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 46 | 25 |
| Clasa 2 | 60 | 33 |
| Clasa 3 | 100 | 45 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,00951.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,223301 | 0,242718 | 0,001619 |
| Clasa 2 | 0,291262 | 0,320388 | 0,002776 |
| Clasa 3 | 0,485437 | 0,436893 | 0,005115 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 25 |
| Clasa 2 | 33 |
| Clasa 3 | 45 |


**Rezolvare**


q = (0,242718; 0,320388; 0,436893); n = 3.
HHI = Σq² = 0,352437; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,028655.
H = −Σq ln(q) = 1,070103 nats; H normalizată = H/ln(n) = 0,97405.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,242718 | 0,058912 | 0,343654 |
| Clasa 2 | 0,320388 | 0,102649 | 0,364673 |
| Clasa 3 | 0,436893 | 0,190876 | 0,361777 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 40


### 1. Auto-organizare — 0.5 p

Într-un depozit, angajații își redistribuie spontan sarcinile când apare aglomerație, fără instrucțiuni de la manager. Identifică proprietatea și dovada.


**Rezolvare**


Este auto-organizare: ordinea apare din interacțiunile locale ale angajaților. Dovada este redistribuirea spontană, fără comandă centrală. Echipa își reorganizează activitatea pentru a răspunde situației.


**Barem de autoevaluare**


- 0.2 p: Numești auto-organizarea

- 0.15 p: observi lipsa comenzii centrale

- 0.15 p: explici ordinea apărută local


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
2. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
3. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 176 | 40 |
| Clasa 2 | 20 | 38 |
| Clasa 3 | 10 | 25 |


**Rezolvare**


Total bază = 206; total curent = 103. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,042862.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,854369 | 0,38835 | 0,367436 |
| Clasa 2 | 0,097087 | 0,368932 | 0,362913 |
| Clasa 3 | 0,048544 | 0,242718 | 0,312512 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 40 |
| Clasa 2 | 38 |
| Clasa 3 | 25 |


**Rezolvare**


q = (0,38835; 0,368932; 0,242718); n = 3.
HHI = Σq² = 0,345838; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,018758.
H = −Σq ln(q) = 1,078852 nats; H normalizată = H/ln(n) = 0,982013.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,38835 | 0,150815 | 0,36732 |
| Clasa 2 | 0,368932 | 0,136111 | 0,367878 |
| Clasa 3 | 0,242718 | 0,058912 | 0,343654 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 41


### 1. Emergență — 0.5 p

Mulți clienți își retrag separat economiile, iar retragerile cumulate produc o criză de lichiditate a băncii. Distinge acțiunea individuală de fenomenul emergent.


**Rezolvare**


Acțiunea individuală este retragerea banilor de către un client. Fenomenul emergent este criza de lichiditate la nivelul băncii, apărută prin cumularea și interacțiunea comportamentelor clienților. Criza este o stare a sistemului, nu acțiunea unui singur client.


**Barem de autoevaluare**


- 0.2 p: Numești emergența

- 0.15 p: identifici retragerea individuală

- 0.15 p: identifici criza la nivelul sistemului


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
2. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
3. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 54 | 96 |
| Clasa 2 | 30 | 70 |
| Clasa 3 | 20 | 42 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,014675.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,519231 | 0,461538 | 0,006795 |
| Clasa 2 | 0,288462 | 0,336538 | 0,007411 |
| Clasa 3 | 0,192308 | 0,201923 | 0,000469 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 96 |
| Clasa 2 | 70 |
| Clasa 3 | 42 |


**Rezolvare**


q = (0,461538; 0,336538; 0,201923); n = 3.
HHI = Σq² = 0,367049; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,050573.
H = −Σq ln(q) = 1,046412 nats; H normalizată = H/ln(n) = 0,952485.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,461538 | 0,213018 | 0,356857 |
| Clasa 2 | 0,336538 | 0,113258 | 0,366505 |
| Clasa 3 | 0,201923 | 0,040773 | 0,32305 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 42


### 1. Feedback pozitiv — 0.5 p

Un zvon provoacă retrageri, retragerile reduc lichiditatea și sporesc teama, iar teama determină alte retrageri. Identifică feedbackul și explică bucla.


**Rezolvare**


Feedbackul este pozitiv, fiindcă amplifică schimbarea inițială. Retragerile reduc lichiditatea, ceea ce mărește teama și produce noi retrageri. Pozitiv înseamnă amplificator, nu benefic pentru bancă.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul pozitiv

- 0.15 p: închizi bucla retrageri → teamă → retrageri

- 0.15 p: explici amplificarea


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
2. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
3. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 64 | 80 |
| Clasa 2 | 30 | 88 |
| Clasa 3 | 10 | 40 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,226668.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,615385 | 0,384615 | 0,108462 |
| Clasa 2 | 0,288462 | 0,423077 | 0,051557 |
| Clasa 3 | 0,096154 | 0,192308 | 0,066649 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 80 |
| Clasa 2 | 88 |
| Clasa 3 | 40 |


**Rezolvare**


q = (0,384615; 0,423077; 0,192308); n = 3.
HHI = Σq² = 0,363905; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,045858.
H = −Σq ln(q) = 1,048485 nats; H normalizată = H/ln(n) = 0,954373.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,384615 | 0,147929 | 0,367504 |
| Clasa 2 | 0,423077 | 0,178994 | 0,363931 |
| Clasa 3 | 0,192308 | 0,036982 | 0,31705 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 43


### 1. Feedback negativ — 0.5 p

Creșterea întârzierilor la livrare determină suplimentarea temporară a personalului; întârzierile scad spre ținta stabilită. Identifică feedbackul și explică.


**Rezolvare**


Feedbackul este negativ: reacția reduce abaterea față de ținta de livrare. Întârzierile declanșează suplimentarea personalului, care le diminuează. Negativ descrie efectul corectiv al buclei, nu o consecință nedorită.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul negativ

- 0.15 p: identifici abaterea și reacția

- 0.15 p: explici reducerea abaterii


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
2. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
3. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 74 | 70 |
| Clasa 2 | 20 | 78 |
| Clasa 3 | 10 | 60 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,614048.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,711538 | 0,336538 | 0,280769 |
| Clasa 2 | 0,192308 | 0,375 | 0,122007 |
| Clasa 3 | 0,096154 | 0,288462 | 0,211272 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 70 |
| Clasa 2 | 78 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,336538; 0,375; 0,288462); n = 3.
HHI = Σq² = 0,337093; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,00564.
H = −Σq ln(q) = 1,092929 nats; H normalizată = H/ln(n) = 0,994827.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,336538 | 0,113258 | 0,366505 |
| Clasa 2 | 0,375 | 0,140625 | 0,367811 |
| Clasa 3 | 0,288462 | 0,08321 | 0,358614 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 44


### 1. Dependență de traiectorie — 0.5 p

O firmă a investit în utilaje dedicate unui singur produs; trecerea la produsele cerute acum presupune costuri mari de înlocuire. Ce proprietate CAS explică această limitare?


**Rezolvare**


Este dependență de traiectorie: deciziile anterioare restrâng opțiunile actuale. Investiția în utilaje specializate face schimbarea costisitoare. Trecutul condiționează evoluția, fără să facă schimbarea imposibilă.


**Barem de autoevaluare**


- 0.2 p: Numești dependența de traiectorie

- 0.15 p: legi investiția trecută de costul actual

- 0.15 p: explici restrângerea opțiunilor


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
2. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
3. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 34 | 180 |
| Clasa 2 | 30 | 18 |
| Clasa 3 | 40 | 10 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,467087.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,326923 | 0,865385 | 0,524165 |
| Clasa 2 | 0,288462 | 0,086538 | 0,24311 |
| Clasa 3 | 0,384615 | 0,048077 | 0,699812 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 180 |
| Clasa 2 | 18 |
| Clasa 3 | 10 |


**Rezolvare**


q = (0,865385; 0,086538; 0,048077); n = 3.
HHI = Σq² = 0,758691; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,638036.
H = −Σq ln(q) = 0,482804 nats; H normalizată = H/ln(n) = 0,439467.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,865385 | 0,748891 | 0,125118 |
| Clasa 2 | 0,086538 | 0,007489 | 0,211774 |
| Clasa 3 | 0,048077 | 0,002311 | 0,145911 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 45


### 1. Explorarea posibilităților — 0.5 p

O firmă testează în paralel trei ambalaje și două canale de vânzare, apoi păstrează combinațiile potrivite pieței. Ce proprietate CAS evidențiază această abordare?


**Rezolvare**


Este explorarea spațiului posibilităților. Firma încearcă mai multe micro-strategii în loc să presupună că există o soluție optimă permanent. Rezultatele experimentelor ajută la selectarea variantelor potrivite condițiilor actuale.


**Barem de autoevaluare**


- 0.2 p: Numești explorarea

- 0.15 p: identifici experimentele paralele

- 0.15 p: explici selectarea/adaptarea strategiilor


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
2. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
3. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 38 | 120 |
| Clasa 2 | 33 | 58 |
| Clasa 3 | 33 | 30 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,238055.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,365385 | 0,576923 | 0,096622 |
| Clasa 2 | 0,317308 | 0,278846 | 0,00497 |
| Clasa 3 | 0,317308 | 0,144231 | 0,136464 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 58 |
| Clasa 3 | 30 |


**Rezolvare**


q = (0,576923; 0,278846; 0,144231); n = 3.
HHI = Σq² = 0,431398; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,147097.
H = −Σq ln(q) = 0,952727 nats; H normalizată = H/ln(n) = 0,86721.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,576923 | 0,33284 | 0,317334 |
| Clasa 2 | 0,278846 | 0,077755 | 0,356113 |
| Clasa 3 | 0,144231 | 0,020803 | 0,27928 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 46


### 1. Departe de echilibru — 0.5 p

În urma unei perturbări persistente a cererii, o firmă deschisă către piață își reorganizează continuu fluxurile și creează noi forme de colaborare. Explică funcționarea departe de echilibru.


**Rezolvare**


Firma funcționează în condiții care o îndepărtează de vechiul regim stabil. Schimburile cu mediul și perturbarea persistentă o determină să creeze noi structuri de colaborare. Departe de echilibru nu înseamnă automat faliment, ci posibilitatea reorganizării în condiții de schimbare.


**Barem de autoevaluare**


- 0.2 p: Identifici îndepărtarea de vechiul regim

- 0.15 p: menționezi schimburile cu mediul

- 0.15 p: explici apariția unor structuri noi


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
2. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
3. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 29 | 130 |
| Clasa 2 | 25 | 38 |
| Clasa 3 | 25 | 20 |
| Clasa 4 | 25 | 20 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,559525.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,278846 | 0,625 | 0,279378 |
| Clasa 2 | 0,240385 | 0,182692 | 0,015833 |
| Clasa 3 | 0,240385 | 0,096154 | 0,132157 |
| Clasa 4 | 0,240385 | 0,096154 | 0,132157 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 130 |
| Clasa 2 | 38 |
| Clasa 3 | 20 |
| Clasa 4 | 20 |


**Rezolvare**


q = (0,625; 0,182692; 0,096154; 0,096154); n = 4.
HHI = Σq² = 0,442493; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,256657.
H = −Σq ln(q) = 1,054668 nats; H normalizată = H/ln(n) = 0,760782.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,625 | 0,390625 | 0,293752 |
| Clasa 2 | 0,182692 | 0,033376 | 0,310568 |
| Clasa 3 | 0,096154 | 0,009246 | 0,225174 |
| Clasa 4 | 0,096154 | 0,009246 | 0,225174 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 47


### 1. Istoricitate — 0.5 p

După o criză, o bancă păstrează proceduri de analiză învățate din pierderile trecute, deși mediul s-a schimbat. Ce proprietate evidențiază influența experienței asupra prezentului?


**Rezolvare**


Este istoricitate: starea prezentă păstrează urmele evoluției trecute. Procedurile curente au fost modelate de experiența crizei. Dacă aceste alegeri limitează și opțiunile viitoare, putem discuta și despre dependență de traiectorie.


**Barem de autoevaluare**


- 0.2 p: Numești istoricitatea

- 0.15 p: indici experiența trecută

- 0.15 p: explici influența asupra prezentului


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
2. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
3. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 44 | 76 |
| Clasa 2 | 30 | 72 |
| Clasa 3 | 20 | 38 |
| Clasa 4 | 10 | 22 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,020386.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,423077 | 0,365385 | 0,008458 |
| Clasa 2 | 0,288462 | 0,346154 | 0,010519 |
| Clasa 3 | 0,192308 | 0,182692 | 0,000493 |
| Clasa 4 | 0,096154 | 0,105769 | 0,000916 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 76 |
| Clasa 2 | 72 |
| Clasa 3 | 38 |
| Clasa 4 | 22 |


**Rezolvare**


q = (0,365385; 0,346154; 0,182692; 0,105769); n = 4.
HHI = Σq² = 0,297892; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,063856.
H = −Σq ln(q) = 1,283274 nats; H normalizată = H/ln(n) = 0,925687.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,365385 | 0,133506 | 0,367871 |
| Clasa 2 | 0,346154 | 0,119822 | 0,367225 |
| Clasa 3 | 0,182692 | 0,033376 | 0,310568 |
| Clasa 4 | 0,105769 | 0,011187 | 0,23761 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 48


### 1. Neliniaritate — 0.5 p

O creștere mică a comenzilor depășește capacitatea bucătăriei și produce o creștere foarte mare a timpului de așteptare. Identifică proprietatea și justifică.


**Rezolvare**


Este neliniaritate: efectul nu este proporțional cu schimbarea cauzei. O creștere mică a cererii trece peste pragul de capacitate și generează întârzieri disproporționate. Mărimea efectului și existența pragului sunt indiciile principale.


**Barem de autoevaluare**


- 0.2 p: Numești neliniaritatea

- 0.15 p: compari cauza mică cu efectul mare

- 0.15 p: explici pragul de capacitate


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
2. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
3. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 79 | 110 |
| Clasa 2 | 15 | 58 |
| Clasa 3 | 10 | 40 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,238958.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,759615 | 0,528846 | 0,083565 |
| Clasa 2 | 0,144231 | 0,278846 | 0,088745 |
| Clasa 3 | 0,096154 | 0,192308 | 0,066649 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 110 |
| Clasa 2 | 58 |
| Clasa 3 | 40 |


**Rezolvare**


q = (0,528846; 0,278846; 0,192308); n = 3.
HHI = Σq² = 0,394416; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,091624.
H = −Σq ln(q) = 1,010068 nats; H normalizată = H/ln(n) = 0,919404.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,528846 | 0,279678 | 0,336906 |
| Clasa 2 | 0,278846 | 0,077755 | 0,356113 |
| Clasa 3 | 0,192308 | 0,036982 | 0,31705 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 49


### 1. Conectivitate — 0.5 p

O platformă transmite în timp real comenzile între clienți, comercianți și curieri. Identifică proprietatea CAS evidențiată și explică indiciul.


**Rezolvare**


Este conectivitate: agenții sunt legați printr-o rețea de comunicare. Dovada este transmiterea comenzilor între clienți, comercianți și curieri. Aceste legături permit circulația informației și coordonarea acțiunilor.


**Barem de autoevaluare**


- 0.2 p: Numești conectivitatea

- 0.15 p: indici legăturile din text

- 0.15 p: explici circulația informației


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Shadow banking: comparație — 0.5 p

Compară banca tradițională cu shadow banking după finanțare și regimul de supraveghere. Adaugă o consecință posibilă.


**Rezolvare**


Banca tradițională se poate finanța din depozite și alte surse, în cadrul supravegherii bancare prudențiale. Shadow banking folosește frecvent finanțarea de piață sau de la investitori, cu reguli dependente de entitate și activitate. Flexibilitatea poate crește oferta de finanțare, dar poate veni cu vulnerabilități de lichiditate și contagiune. Comparația este generală și nu reproduce slide-ul 14, absent din materialele disponibile.


**Barem de autoevaluare**


- 0.2 p: Compari sursele de finanțare

- 0.15 p: compari regimurile fără a spune «fără reguli»

- 0.15 p: menționezi o implicație


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.
2. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
3. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 24 | 50 |
| Clasa 2 | 30 | 68 |
| Clasa 3 | 50 | 90 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,010272.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,230769 | 0,240385 | 0,000393 |
| Clasa 2 | 0,288462 | 0,326923 | 0,004814 |
| Clasa 3 | 0,480769 | 0,432692 | 0,005065 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 50 |
| Clasa 2 | 68 |
| Clasa 3 | 90 |


**Rezolvare**


q = (0,240385; 0,326923; 0,432692); n = 3.
HHI = Σq² = 0,351886; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,027829.
H = −Σq ln(q) = 1,07066 nats; H normalizată = H/ln(n) = 0,974557.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,240385 | 0,057785 | 0,342672 |
| Clasa 2 | 0,326923 | 0,106879 | 0,36551 |
| Clasa 3 | 0,432692 | 0,187223 | 0,362479 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 50


### 1. Interdependență — 0.5 p

Un furnizor livrează făina cu întârziere; cofetăria amână producția, iar curierii își modifică livrările. Identifică proprietatea CAS și explică lanțul de influență.


**Rezolvare**


Este interdependență: funcționarea unui actor influențează funcționarea celorlalți. Întârzierea furnizorului schimbă producția și apoi livrarea. Nu este doar existența unei legături, ci transmiterea efectelor prin acea legătură.


**Barem de autoevaluare**


- 0.2 p: Numești interdependența

- 0.15 p: urmărești furnizor → producție → livrare

- 0.15 p: deosebești legătura de efect


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Banca: trei proprietăți CAS — 0.5 p

Prezintă trei proprietăți CAS ale băncii, incluzând conectivitatea și interdependența.


**Rezolvare**


Banca prezintă conectivitate prin fluxurile dintre depozite, creditare, trezorerie și risc. Interdependența apare când pierderile din credite afectează capitalul și deciziile ulterioare. Adaptarea apare când banca își ajustează politicile după modificarea riscului și a comportamentului clienților. Fiecare proprietate este legată de un mecanism concret.


**Barem de autoevaluare**


- 0.2 p: Conectivitate și exemplu

- 0.15 p: interdependență și exemplu

- 0.15 p: adaptare sau altă proprietate justificată


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.
2. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
3. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 89 | 80 |
| Clasa 2 | 10 | 78 |
| Clasa 3 | 5 | 50 |


**Rezolvare**


Total bază = 104; total curent = 208. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,065819.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,855769 | 0,384615 | 0,376809 |
| Clasa 2 | 0,096154 | 0,375 | 0,379503 |
| Clasa 3 | 0,048077 | 0,240385 | 0,309507 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 80 |
| Clasa 2 | 78 |
| Clasa 3 | 50 |


**Rezolvare**


q = (0,384615; 0,375; 0,240385); n = 3.
HHI = Σq² = 0,346339; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,019508.
H = −Σq ln(q) = 1,077987 nats; H normalizată = H/ln(n) = 0,981226.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,384615 | 0,147929 | 0,367504 |
| Clasa 2 | 0,375 | 0,140625 | 0,367811 |
| Clasa 3 | 0,240385 | 0,057785 | 0,342672 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 51


### 1. Coevoluție — 0.5 p

O bancă lansează servicii digitale, concurentul introduce servicii mai rapide, iar prima bancă își îmbunătățește oferta ca răspuns. Identifică proprietatea și justifică.


**Rezolvare**


Este coevoluție exogenă, deoarece două organizații se adaptează reciproc. Oferta primei bănci schimbă decizia concurentului, iar răspunsul acestuia determină o nouă schimbare la prima bancă. Evoluția fiecăreia modifică mediul celeilalte.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: identifici cele două sensuri ale influenței

- 0.15 p: explici adaptarea reciprocă


### 2. VSM: recursivitate — 0.5 p

O companie are filiale care produc, se coordonează și își planifică dezvoltarea, în limitele politicilor comune. Explică recursivitatea și autonomia în VSM.


**Rezolvare**


Recursivitatea înseamnă că aceleași funcții de viabilitate apar la mai multe niveluri. Filiala poate fi un sistem viabil inclus în sistemul viabil al companiei. Autonomia deciziilor locale este compatibilă cu politicile comune și cu păstrarea coerenței ansamblului.


**Barem de autoevaluare**


- 0.2 p: Explici repetarea funcțiilor

- 0.15 p: aplici relația filială–companie

- 0.15 p: deosebești autonomia de lipsa coordonării


### 3. Shadow banking: sens și 2007 — 0.5 p

Definește shadow banking, precizează semnificația anului 2007 și explică ideea de libertate mai mare față de banca tradițională.


**Rezolvare**


Shadow banking desemnează intermedierea creditului prin entități și activități din afara sistemului bancar regulat. Termenul este atribuit lui Paul McCulley în 2007; activitățile nu au început toate în acel an. Libertatea mai mare se referă la flexibilitatea și regimul diferit față de cadrul bancar prudențial. Nu înseamnă că orice asemenea instituție este ilegală ori complet nereglementată.


**Barem de autoevaluare**


- 0.2 p: Definești intermedierea din afara băncilor

- 0.15 p: legi 2007 de termen, nu de începutul tuturor activităților

- 0.15 p: explici corect flexibilitatea


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.
2. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
3. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 110 | 144 |
| Clasa 2 | 60 | 108 |
| Clasa 3 | 40 | 63 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,019959.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,52381 | 0,457143 | 0,009075 |
| Clasa 2 | 0,285714 | 0,342857 | 0,010418 |
| Clasa 3 | 0,190476 | 0,2 | 0,000465 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 144 |
| Clasa 2 | 108 |
| Clasa 3 | 63 |


**Rezolvare**


q = (0,457143; 0,342857; 0,2); n = 3.
HHI = Σq² = 0,366531; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,049796.
H = −Σq ln(q) = 1,046729 nats; H normalizată = H/ln(n) = 0,952774.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,457143 | 0,20898 | 0,357833 |
| Clasa 2 | 0,342857 | 0,117551 | 0,367008 |
| Clasa 3 | 0,2 | 0,04 | 0,321888 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 52


### 1. Auto-organizare — 0.5 p

Într-un depozit, angajații își redistribuie spontan sarcinile când apare aglomerație, fără instrucțiuni de la manager. Identifică proprietatea și dovada.


**Rezolvare**


Este auto-organizare: ordinea apare din interacțiunile locale ale angajaților. Dovada este redistribuirea spontană, fără comandă centrală. Echipa își reorganizează activitatea pentru a răspunde situației.


**Barem de autoevaluare**


- 0.2 p: Numești auto-organizarea

- 0.15 p: observi lipsa comenzii centrale

- 0.15 p: explici ordinea apărută local


### 2. Firma: cost, factori, finanțe — 0.5 p

Într-o firmă se calculează rentabilitatea produselor, se cumpără materiale și se negociază un credit pentru plăți. Asociază cele trei activități subsistemelor firmei.


**Rezolvare**


Rentabilitatea produselor ține de SPCP, care urmărește prețurile, costurile și profitabilitatea. Cumpărarea materialelor ține de SAFP, care asigură factorii de producție. Negocierea creditului pentru plăți ține de SF, care asigură finanțarea și gestionează fluxurile bănești.


**Barem de autoevaluare**


- 0.2 p: Asociezi rentabilitatea cu SPCP

- 0.15 p: asociezi materialele cu SAFP

- 0.15 p: asociezi finanțarea cu SF


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.
2. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
3. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 130 | 120 |
| Clasa 2 | 60 | 135 |
| Clasa 3 | 20 | 60 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,239535.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,619048 | 0,380952 | 0,115597 |
| Clasa 2 | 0,285714 | 0,428571 | 0,057924 |
| Clasa 3 | 0,095238 | 0,190476 | 0,066014 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 135 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,380952; 0,428571; 0,190476); n = 3.
HHI = Σq² = 0,365079; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,047619.
H = −Σq ln(q) = 1,04663 nats; H normalizată = H/ln(n) = 0,952684.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,380952 | 0,145125 | 0,36765 |
| Clasa 2 | 0,428571 | 0,183673 | 0,363128 |
| Clasa 3 | 0,190476 | 0,036281 | 0,315853 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 53


### 1. Emergență — 0.5 p

Mulți clienți își retrag separat economiile, iar retragerile cumulate produc o criză de lichiditate a băncii. Distinge acțiunea individuală de fenomenul emergent.


**Rezolvare**


Acțiunea individuală este retragerea banilor de către un client. Fenomenul emergent este criza de lichiditate la nivelul băncii, apărută prin cumularea și interacțiunea comportamentelor clienților. Criza este o stare a sistemului, nu acțiunea unui singur client.


**Barem de autoevaluare**


- 0.2 p: Numești emergența

- 0.15 p: identifici retragerea individuală

- 0.15 p: identifici criza la nivelul sistemului


### 2. VSM: activități primare — 0.5 p

Într-o brutărie se frământă aluatul, se coc pâinile și se pregătesc produsele comandate. Identifică sistemul VSM ilustrat și explică rolul său.


**Rezolvare**


Este S1, sistemul operațional care realizează activitățile primare. Frământarea și coacerea transformă resursele în produsele pentru care există brutăria. Clasificăm funcția descrisă în context, nu doar numele departamentului.


**Barem de autoevaluare**


- 0.2 p: Identifici S1

- 0.15 p: legi activitățile de produsul final

- 0.15 p: explici rolul operațional


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.
2. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
3. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 150 | 105 |
| Clasa 2 | 40 | 120 |
| Clasa 3 | 20 | 90 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,631627.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,714286 | 0,333333 | 0,290339 |
| Clasa 2 | 0,190476 | 0,380952 | 0,132028 |
| Clasa 3 | 0,095238 | 0,285714 | 0,209259 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 105 |
| Clasa 2 | 120 |
| Clasa 3 | 90 |


**Rezolvare**


q = (0,333333; 0,380952; 0,285714); n = 3.
HHI = Σq² = 0,337868; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,006803.
H = −Σq ln(q) = 1,091786 nats; H normalizată = H/ln(n) = 0,993787.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,333333 | 0,111111 | 0,366204 |
| Clasa 2 | 0,380952 | 0,145125 | 0,36765 |
| Clasa 3 | 0,285714 | 0,081633 | 0,357932 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 54


### 1. Feedback pozitiv — 0.5 p

Un zvon provoacă retrageri, retragerile reduc lichiditatea și sporesc teama, iar teama determină alte retrageri. Identifică feedbackul și explică bucla.


**Rezolvare**


Feedbackul este pozitiv, fiindcă amplifică schimbarea inițială. Retragerile reduc lichiditatea, ceea ce mărește teama și produce noi retrageri. Pozitiv înseamnă amplificator, nu benefic pentru bancă.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul pozitiv

- 0.15 p: închizi bucla retrageri → teamă → retrageri

- 0.15 p: explici amplificarea


### 2. VSM: viitor și identitate — 0.5 p

Un spital pregătește servicii pentru îmbătrânirea populației, iar conducerea stabilește misiunea de a oferi îngrijire accesibilă. Identifică cele două sisteme VSM.


**Rezolvare**


Pregătirea pentru nevoile viitoare este S4: urmărește mediul și planifică adaptarea. Stabilirea misiunii este S5: definește identitatea și politicile fundamentale. S4 propune răspunsuri la viitor, iar S5 asigură coerența lor cu identitatea organizației.


**Barem de autoevaluare**


- 0.2 p: Identifici S4

- 0.15 p: identifici S5

- 0.15 p: justifici viitor versus identitate


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.
2. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
3. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 70 | 270 |
| Clasa 2 | 60 | 30 |
| Clasa 3 | 80 | 15 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,397125.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,333333 | 0,857143 | 0,494718 |
| Clasa 2 | 0,285714 | 0,095238 | 0,209259 |
| Clasa 3 | 0,380952 | 0,047619 | 0,693147 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 270 |
| Clasa 2 | 30 |
| Clasa 3 | 15 |


**Rezolvare**


q = (0,857143; 0,095238; 0,047619); n = 3.
HHI = Σq² = 0,746032; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,619048.
H = −Σq ln(q) = 0,501047 nats; H normalizată = H/ln(n) = 0,456073.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: roșu — diversificare redusă. Analiză aprofundată și plan de acțiune.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,857143 | 0,734694 | 0,132129 |
| Clasa 2 | 0,095238 | 0,00907 | 0,223941 |
| Clasa 3 | 0,047619 | 0,002268 | 0,144977 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 55


### 1. Feedback negativ — 0.5 p

Creșterea întârzierilor la livrare determină suplimentarea temporară a personalului; întârzierile scad spre ținta stabilită. Identifică feedbackul și explică.


**Rezolvare**


Feedbackul este negativ: reacția reduce abaterea față de ținta de livrare. Întârzierile declanșează suplimentarea personalului, care le diminuează. Negativ descrie efectul corectiv al buclei, nu o consecință nedorită.


**Barem de autoevaluare**


- 0.2 p: Numești feedbackul negativ

- 0.15 p: identifici abaterea și reacția

- 0.15 p: explici reducerea abaterii


### 2. Firma: piață versus producție — 0.5 p

O echipă studiază cererea, preia comenzile și estimează vânzările; alta stabilește tehnologia și realizează produsele. Identifică subsistemele firmei.


**Rezolvare**


Prima echipă îndeplinește funcțiile SRPB, subsistemul raporturilor cu piața. A doua aparține funcțional SP-T, subsistemul de producție/tehnologic. Informația despre cerere orientează programul de producție, iar rezultatul producției ajunge pe piață.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB

- 0.15 p: identifici SP-T

- 0.15 p: explici legătura cerere–producție


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor vrea să unească stocurile, facturarea și contabilitatea într-o bază de date comună.
2. O clinică dorește urmărirea solicitărilor clienților, a preferințelor și a campaniilor de fidelizare.
3. Un producător de mobilă dorește să coordoneze lemnul de la furnizori, capacitatea de fabricație și livrarea produselor.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 78 | 180 |
| Clasa 2 | 66 | 90 |
| Clasa 3 | 66 | 45 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,224044.
Semafor: galben — schimbare relevantă a distribuției. Investighează segmentele și cauzele.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,371429 | 0,571429 | 0,086157 |
| Clasa 2 | 0,314286 | 0,285714 | 0,002723 |
| Clasa 3 | 0,314286 | 0,142857 | 0,135164 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 180 |
| Clasa 2 | 90 |
| Clasa 3 | 45 |


**Rezolvare**


q = (0,571429; 0,285714; 0,142857); n = 3.
HHI = Σq² = 0,428571; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,142857.
H = −Σq ln(q) = 0,9557 nats; H normalizată = H/ln(n) = 0,869916.
HHI: galben — concentrare moderată. Investighează segmentele și cauzele.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,571429 | 0,326531 | 0,31978 |
| Clasa 2 | 0,285714 | 0,081633 | 0,357932 |
| Clasa 3 | 0,142857 | 0,020408 | 0,277987 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 56


### 1. Dependență de traiectorie — 0.5 p

O firmă a investit în utilaje dedicate unui singur produs; trecerea la produsele cerute acum presupune costuri mari de înlocuire. Ce proprietate CAS explică această limitare?


**Rezolvare**


Este dependență de traiectorie: deciziile anterioare restrâng opțiunile actuale. Investiția în utilaje specializate face schimbarea costisitoare. Trecutul condiționează evoluția, fără să facă schimbarea imposibilă.


**Barem de autoevaluare**


- 0.2 p: Numești dependența de traiectorie

- 0.15 p: legi investiția trecută de costul actual

- 0.15 p: explici restrângerea opțiunilor


### 2. VSM: S2 și S3 — 0.5 p

Prezintă pe scurt S2 și S3 în VSM. Dă câte un exemplu și precizează diferența.


**Rezolvare**


S2 coordonează unitățile operaționale și previne conflictele, de exemplu printr-un program comun pentru folosirea cuptorului. S3 reglează și optimizează ansamblul intern, de exemplu redistribuind bugetul și personalul între ateliere. S2 urmărește compatibilitatea activităților, iar S3 performanța globală și utilizarea resurselor.


**Barem de autoevaluare**


- 0.2 p: Explici S2 și dai exemplu

- 0.15 p: explici S3 și dai exemplu

- 0.15 p: formulezi diferența


### 3. Banca: coevoluție — 0.5 p

O bancă introduce plăți mobile, clienții își schimbă obiceiurile, iar banca redesenează serviciile după aceste obiceiuri. Explică de ce este coevoluție.


**Rezolvare**


Este coevoluție: banca și clienții își modifică reciproc comportamentul. Noua ofertă schimbă obiceiurile clienților, iar acestea determină o nouă adaptare a băncii. Nu avem doar o reacție izolată, ci o succesiune de influențe reciproce.


**Barem de autoevaluare**


- 0.2 p: Numești coevoluția

- 0.15 p: explici influența bancă → clienți

- 0.15 p: explici influența clienți → bancă


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O firmă de asigurări vrea istoricul clienților, notificări de reînnoire și urmărirea ofertelor personalizate.
2. O firmă alimentară dorește să coreleze livrările fermierilor cu procesarea, stocurile și distribuția produselor.
3. Un producător vrea rapoarte consistente între producție, costuri, achiziții și contabilitate.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 60 | 195 |
| Clasa 2 | 50 | 60 |
| Clasa 3 | 50 | 30 |
| Clasa 4 | 50 | 30 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,530153.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,285714 | 0,619048 | 0,25773 |
| Clasa 2 | 0,238095 | 0,190476 | 0,010626 |
| Clasa 3 | 0,238095 | 0,095238 | 0,130899 |
| Clasa 4 | 0,238095 | 0,095238 | 0,130899 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 195 |
| Clasa 2 | 60 |
| Clasa 3 | 30 |
| Clasa 4 | 30 |


**Rezolvare**


q = (0,619048; 0,190476; 0,095238; 0,095238); n = 4.
HHI = Σq² = 0,437642; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,250189.
H = −Σq ln(q) = 1,060613 nats; H normalizată = H/ln(n) = 0,76507.
HHI: roșu — concentrare ridicată. Analiză aprofundată și plan de acțiune.
Entropie: galben — diversificare moderată. Investighează segmentele și cauzele.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,619048 | 0,38322 | 0,296879 |
| Clasa 2 | 0,190476 | 0,036281 | 0,315853 |
| Clasa 3 | 0,095238 | 0,00907 | 0,223941 |
| Clasa 4 | 0,095238 | 0,00907 | 0,223941 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 57


### 1. Explorarea posibilităților — 0.5 p

O firmă testează în paralel trei ambalaje și două canale de vânzare, apoi păstrează combinațiile potrivite pieței. Ce proprietate CAS evidențiază această abordare?


**Rezolvare**


Este explorarea spațiului posibilităților. Firma încearcă mai multe micro-strategii în loc să presupună că există o soluție optimă permanent. Rezultatele experimentelor ajută la selectarea variantelor potrivite condițiilor actuale.


**Barem de autoevaluare**


- 0.2 p: Numești explorarea

- 0.15 p: identifici experimentele paralele

- 0.15 p: explici selectarea/adaptarea strategiilor


### 2. VSM: S3* — 0.5 p

Raportul unui depozit indică 20 kg de materie primă; o inspecție directă găsește numai 12 kg. Identifică funcția VSM și explică rolul verificării.


**Rezolvare**


Este S3*, canalul de audit/verificare directă a operațiunilor. Inspecția confruntă raportul cu realitatea și evidențiază diferența de stoc. Informația sprijină S3 în corectarea controlului intern și a utilizării resurselor.


**Barem de autoevaluare**


- 0.2 p: Identifici S3*

- 0.15 p: citezi confruntarea raport–realitate

- 0.15 p: explici sprijinul pentru controlul intern


### 3. Shadow banking: caz — 0.5 p

O societate care nu este bancă finanțează împrumuturi din fonduri atrase de la investitori. Explică legătura cu shadow banking și o posibilă vulnerabilitate.


**Rezolvare**


Cazul ilustrează intermedierea creditului în afara sistemului bancar tradițional. Finanțarea prin investitori și flexibilitatea activității sunt compatibile cu shadow banking. Dacă finanțarea se retrage mai repede decât se încasează împrumuturile, poate apărea o vulnerabilitate de lichiditate. Eticheta nu înseamnă automat ilegalitate.


**Barem de autoevaluare**


- 0.2 p: Identifici intermedierea nebancară

- 0.15 p: legi sursa de finanțare de caz

- 0.15 p: explici riscul de lichiditate


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un producător vrea să sincronizeze materiile prime de la furnizori, producția, depozitele și transportul către distribuitori.
2. Un lanț de magazine introduce aceleași date în mai multe aplicații și cere gestiune unificată pentru stocuri și finanțe.
3. O agenție de turism dorește să gestioneze clienții potențiali, ofertele și comunicările de după vânzare.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 90 | 114 |
| Clasa 2 | 60 | 111 |
| Clasa 3 | 40 | 57 |
| Clasa 4 | 20 | 33 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,026649.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,428571 | 0,361905 | 0,011272 |
| Clasa 2 | 0,285714 | 0,352381 | 0,013981 |
| Clasa 3 | 0,190476 | 0,180952 | 0,000489 |
| Clasa 4 | 0,095238 | 0,104762 | 0,000908 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 114 |
| Clasa 2 | 111 |
| Clasa 3 | 57 |
| Clasa 4 | 33 |


**Rezolvare**


q = (0,361905; 0,352381; 0,180952; 0,104762); n = 4.
HHI = Σq² = 0,298866; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,065155.
H = −Σq ln(q) = 1,281071 nats; H normalizată = H/ln(n) = 0,924097.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,361905 | 0,130975 | 0,367831 |
| Clasa 2 | 0,352381 | 0,124172 | 0,367548 |
| Clasa 3 | 0,180952 | 0,032744 | 0,309342 |
| Clasa 4 | 0,104762 | 0,010975 | 0,23635 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 58


### 1. Departe de echilibru — 0.5 p

În urma unei perturbări persistente a cererii, o firmă deschisă către piață își reorganizează continuu fluxurile și creează noi forme de colaborare. Explică funcționarea departe de echilibru.


**Rezolvare**


Firma funcționează în condiții care o îndepărtează de vechiul regim stabil. Schimburile cu mediul și perturbarea persistentă o determină să creeze noi structuri de colaborare. Departe de echilibru nu înseamnă automat faliment, ci posibilitatea reorganizării în condiții de schimbare.


**Barem de autoevaluare**


- 0.2 p: Identifici îndepărtarea de vechiul regim

- 0.15 p: menționezi schimburile cu mediul

- 0.15 p: explici apariția unor structuri noi


### 2. Firma: cinci subsisteme — 0.5 p

Enumeră cele cinci subsisteme cibernetice ale firmei și asociază fiecăruia activitatea principală.


**Rezolvare**


SRPB gestionează raporturile cu piața: cerere, comenzi și livrare. SP-T realizează producția, iar SPCP analizează prețurile, costurile și profitabilitatea. SAFP asigură factorii de producție, iar SF gestionează finanțarea și fluxurile bănești. Împreună transformă cererea în producție și rezultate economice.


**Barem de autoevaluare**


- 0.2 p: Identifici SRPB și SP-T

- 0.15 p: identifici SPCP și SAFP

- 0.15 p: identifici SF și rolurile corecte


### 3. Banca: subsisteme — 0.5 p

Numește cel puțin patru subsisteme/funcții ale băncii și explică o legătură dintre ele.


**Rezolvare**


Putem identifica depozitele, creditarea, trezoreria, managementul riscului, capitalul și lichiditatea. Depozitele contribuie la finanțare, iar creditarea transformă fondurile în expuneri. Monitorizarea riscului influențează limitele și deciziile de creditare, iar pierderile pot afecta capitalul. Subsistemele sunt legate atât prin bani, cât și prin informații.


**Barem de autoevaluare**


- 0.2 p: Numești minimum patru funcții

- 0.15 p: descrii o legătură financiară

- 0.15 p: descrii o legătură informațională


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. O fabrică ține separat salariile, achizițiile și vânzările și dorește integrarea proceselor interne.
2. O bancă vrea o imagine comună a interacțiunilor cu clienții și oferte adaptate nevoilor lor.
3. Un comerciant dorește planificarea comună a aprovizionării, stocurilor și livrărilor cu partenerii săi logistici.


**Rezolvare**


1. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
2. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
3. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi ERP pentru situația 1

- 0.15 p: Alegi CRM pentru situația 2

- 0.15 p: Alegi SCM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 160 | 165 |
| Clasa 2 | 30 | 90 |
| Clasa 3 | 20 | 60 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,254248.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,761905 | 0,52381 | 0,089213 |
| Clasa 2 | 0,142857 | 0,285714 | 0,099021 |
| Clasa 3 | 0,095238 | 0,190476 | 0,066014 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 165 |
| Clasa 2 | 90 |
| Clasa 3 | 60 |


**Rezolvare**


q = (0,52381; 0,285714; 0,190476); n = 3.
HHI = Σq² = 0,39229; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,088435.
H = −Σq ln(q) = 1,012495 nats; H normalizată = H/ln(n) = 0,921612.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,52381 | 0,274376 | 0,338709 |
| Clasa 2 | 0,285714 | 0,081633 | 0,357932 |
| Clasa 3 | 0,190476 | 0,036281 | 0,315853 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 59


### 1. Istoricitate — 0.5 p

După o criză, o bancă păstrează proceduri de analiză învățate din pierderile trecute, deși mediul s-a schimbat. Ce proprietate evidențiază influența experienței asupra prezentului?


**Rezolvare**


Este istoricitate: starea prezentă păstrează urmele evoluției trecute. Procedurile curente au fost modelate de experiența crizei. Dacă aceste alegeri limitează și opțiunile viitoare, putem discuta și despre dependență de traiectorie.


**Barem de autoevaluare**


- 0.2 p: Numești istoricitatea

- 0.15 p: indici experiența trecută

- 0.15 p: explici influența asupra prezentului


### 2. Firma: varietate necesară — 0.5 p

Clienții unei firme au cerințe foarte diferite, iar firma creează mai multe opțiuni de produs și proceduri flexibile. Explică varietatea necesară.


**Rezolvare**


Varietatea necesară cere ca firma să aibă suficiente răspunsuri pentru diversitatea situațiilor relevante din mediu. Opțiunile de produs și procedurile flexibile îi permit să răspundă unor cereri diferite. Nu trebuie multiplicată inutil complexitatea, ci construită capacitatea de răspuns potrivită.


**Barem de autoevaluare**


- 0.2 p: Numești varietatea necesară

- 0.15 p: legi răspunsurile de cereri

- 0.15 p: explici adaptarea capacității de răspuns


### 3. Shadow banking: exemple — 0.5 p

Dă trei exemple de entități/vehicule asociate shadow banking și explică ce le apropie de această activitate.


**Rezolvare**


Exemple sunt societățile financiare nebancare care acordă credite, anumite fonduri monetare implicate în finanțare și vehiculele de securitizare. Ele pot participa la intermedierea creditului în afara băncilor tradiționale. Încadrarea depinde de activitate și risc, astfel că nu orice instituție nebancară este automat shadow banking.


**Barem de autoevaluare**


- 0.2 p: Oferi trei exemple potrivite

- 0.15 p: explici intermedierea creditului

- 0.15 p: nu echivalezi toate entitățile nebancare cu shadow banking


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește evidența discuțiilor cu clienții, a oportunităților de vânzare și a reclamațiilor.
2. O fabrică auto vrea să urmărească piesele de la furnizori până la asamblare și livrarea către dealeri.
3. O companie care a cumpărat trei filiale dorește o platformă comună pentru operațiuni, resurse și raportare financiară.


**Rezolvare**


1. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
2. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
3. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi CRM pentru situația 1

- 0.15 p: Alegi SCM pentru situația 2

- 0.15 p: Alegi ERP pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 50 | 75 |
| Clasa 2 | 60 | 105 |
| Clasa 3 | 100 | 135 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 0,012358.
Semafor: verde — abateri mici; distribuție stabilă. Monitorizare obișnuită.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,238095 | 0,238095 | 0 |
| Clasa 2 | 0,285714 | 0,333333 | 0,007341 |
| Clasa 3 | 0,47619 | 0,428571 | 0,005017 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 75 |
| Clasa 2 | 105 |
| Clasa 3 | 135 |


**Rezolvare**


q = (0,238095; 0,333333; 0,428571); n = 3.
HHI = Σq² = 0,351474; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,027211.
H = −Σq ln(q) = 1,071019 nats; H normalizată = H/ln(n) = 0,974883.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,238095 | 0,056689 | 0,341687 |
| Clasa 2 | 0,333333 | 0,111111 | 0,366204 |
| Clasa 3 | 0,428571 | 0,183673 | 0,363128 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată


## Varianta 60


### 1. Neliniaritate — 0.5 p

O creștere mică a comenzilor depășește capacitatea bucătăriei și produce o creștere foarte mare a timpului de așteptare. Identifică proprietatea și justifică.


**Rezolvare**


Este neliniaritate: efectul nu este proporțional cu schimbarea cauzei. O creștere mică a cererii trece peste pragul de capacitate și generează întârzieri disproporționate. Mărimea efectului și existența pragului sunt indiciile principale.


**Barem de autoevaluare**


- 0.2 p: Numești neliniaritatea

- 0.15 p: compari cauza mică cu efectul mare

- 0.15 p: explici pragul de capacitate


### 2. VSM: coordonare și optimizare — 0.5 p

Două ateliere rezervă simultan un utilaj; se introduce un orar comun. Conducerea mută apoi personal și buget între ateliere pentru reducerea costului total. Identifică cele două funcții VSM.


**Rezolvare**


Orarul comun reprezintă S2: coordonează utilizarea utilajului și previne conflictele între unități. Redistribuirea resurselor reprezintă S3: optimizează performanța întregii firme. Diferența este între armonizarea activităților și alegerea utilizării eficiente a resurselor.


**Barem de autoevaluare**


- 0.2 p: Asociezi orarul cu S2

- 0.15 p: asociezi resursele cu S3

- 0.15 p: justifici diferența


### 3. Banca: conectivitate și interdependență — 0.5 p

Descrie conectivitatea și interdependența unei bănci, cu câte un exemplu concret.


**Rezolvare**


Conectivitatea se vede în fluxurile financiare și informaționale dintre creditare, depozite, trezorerie și risc. Interdependența înseamnă că modificarea unui subsistem afectează celelalte: mai multe credite pot crește necesarul de finanțare și capital. Legătura descrie rețeaua, iar influența descrie propagarea schimbării prin rețea.


**Barem de autoevaluare**


- 0.2 p: Explici conectivitatea prin fluxuri

- 0.15 p: explici interdependența prin efect

- 0.15 p: diferențiezi cele două proprietăți


### 4. IT: trei situații — 0.5 p

Pentru fiecare dintre cele trei fraze, alege soluția IT dominantă (ERP, CRM sau SCM) și justifică prin nevoia descrisă.
1. Un distribuitor dorește coordonarea aprovizionării cu furnizorii, a depozitării și a transporturilor către magazine.
2. O firmă de asigurări dorește integrarea contabilității, bugetelor și resurselor umane într-un sistem comun.
3. Un magazin online dorește segmentarea clienților și urmărirea campaniilor și a reclamațiilor.


**Rezolvare**


1. SCM: SCM coordonează lanțul furnizori–aprovizionare–producție/depozitare–distribuție și fluxurile dintre parteneri.
2. ERP: ERP integrează datele și procesele interne, astfel încât funcțiile firmei să folosească informații coerente.
3. CRM: CRM gestionează relațiile cu clienții: contactele, ofertele, serviciile și fidelizarea.
Alegerea se face după nevoie, nu doar după sectorul firmei. În curs apare CRM, nu CRL.


**Barem de autoevaluare**


- 0.15 p: Alegi SCM pentru situația 1

- 0.15 p: Alegi ERP pentru situația 2

- 0.15 p: Alegi CRM pentru situația 3

- 0.05 p: Justifici alegerile prin indiciile din enunț


### 5. PSI și semafor — 1 p

Tabelul conține numere de clienți pe aceleași clase, la două momente. Calculează ponderile pentru fiecare moment, contribuțiile și PSI total. Aplică tehnica semaforului și propune o acțiune justificată. Folosește ln (logaritm natural); păstrează precizia până la clasificare.

| Clasă | Bază | Curent |
| --- | --- | --- |
| Clasa 1 | 180 | 120 |
| Clasa 2 | 20 | 120 |
| Clasa 3 | 10 | 75 |


**Rezolvare**


Total bază = 210; total curent = 315. Împarți fiecare coloană la propriul total.
PSI = Σ(p − q) ln(p/q) = 1,088801.
Semafor: roșu — schimbare importantă a distribuției. Analiză aprofundată și plan de acțiune.
PSI indică schimbarea distribuției; nu stabilește singur dacă riscul a crescut sau dacă modelul trebuie înlocuit.

| Clasă | p bază | q curent | (p−q) ln(p/q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,857143 | 0,380952 | 0,386157 |
| Clasa 2 | 0,095238 | 0,380952 | 0,396084 |
| Clasa 3 | 0,047619 | 0,238095 | 0,30656 |


**Barem de autoevaluare**


- 0.2 p: Normalizezi separat cele două coloane și obții ponderile

- 0.2 p: Aplici formula și calculezi contribuțiile pe clase

- 0.2 p: Aduni contribuțiile pentru PSI total

- 0.2 p: Alegi culoarea corectă

- 0.2 p: Interpretezi schimbarea și propui acțiunea


### 6. HHI, entropie și semafor — 1 p

Pe distribuția curentă din tabel, calculează HHI brut și normalizat, apoi entropia Shannon brută și normalizată. Aplică semaforul celor doi indicatori normalizați și explică rezultatele. Folosește ln; n este numărul claselor.

| Clasă | Clienți curent |
| --- | --- |
| Clasa 1 | 120 |
| Clasa 2 | 120 |
| Clasa 3 | 75 |


**Rezolvare**


q = (0,380952; 0,380952; 0,238095); n = 3.
HHI = Σq² = 0,346939; HHI normalizat = (n × HHI − 1)/(n − 1) = 0,020408.
H = −Σq ln(q) = 1,076987 nats; H normalizată = H/ln(n) = 0,980315.
HHI: verde — concentrare redusă. Monitorizare obișnuită.
Entropie: verde — diversificare ridicată. Monitorizare obișnuită.
HHI mare semnalează concentrare, iar entropia mare semnalează diversificare. Culorile pot diferi deoarece pragurile și măsurile diferă.

| Clasă | q | q² | −q ln(q) |
| --- | --- | --- | --- |
| Clasa 1 | 0,380952 | 0,145125 | 0,36765 |
| Clasa 2 | 0,380952 | 0,145125 | 0,36765 |
| Clasa 3 | 0,238095 | 0,056689 | 0,341687 |


**Barem de autoevaluare**


- 0.15 p: Calculezi HHI brut din ponderi

- 0.15 p: Normalizezi HHI corect

- 0.15 p: Calculezi entropia brută cu ln

- 0.15 p: Normalizezi entropia prin ln(n)

- 0.2 p: Clasifici și interpretezi HHI normalizat

- 0.2 p: Clasifici și interpretezi entropia normalizată
