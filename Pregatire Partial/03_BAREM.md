# Barem explicat — simulare

Nu este baremul oficial. Fiecare exercițiu are 1 punct; 1 punct este din oficiu. Tolerăm diferențe mici rezultate din rotunjirea outputurilor. Un răspuns care afirmă contrariul interpretării corecte nu primește punctaj pe acea parte.

## 1. Descriptive (1p)

- **0,35p:** media ratei este 6,54%; SD este 3,13 puncte procentuale; jumătatea centrală este între 4,00% și 8,05%.
- **0,40p:** IQR=8,05−4,00=4,05. Limita superioară=8,05+1,5×4,05=14,125. 16,50 depășește pragul, deci este outlier superior potrivit convenției precizate.
- **0,25p:** nu se elimină automat; se verifică dacă este eroare sau observație reală. Faptul că este outlier nu dovedește eroare.

## 2. Corelație și standardizare (1p)

- **0,35p:** asociere liniară pozitivă (r=0,585); regiunile cu utilizare digitală mai ridicată tind să aibă PIB mai mare. Nu se afirmă efect cauzal.
- **0,20p:** nu putem afirma semnificație statistică doar din coeficientul prezentat; lipsesc informațiile testului/intervalului.
- **0,25p:** unități și scări diferite; standardizarea împiedică dominarea prin dispersie numerică mare în ACP pe covarianțe.
- **0,20p:** 2e−16 este aproximativ zero la precizia numerică; SD=1 este comportamentul așteptat după standardizare.

## 3. Alt set de date (1p)

- **0,25p:** lambda1≈2,0396²≈4,16; suma lambda=8 deoarece analiza este pe corelații cu 8 variabile.
- **0,30p:** Kaiser: două axe, cu lambda 4,16 și 1,28; restul sunt sub 1. Pentru minimum 80%: patru axe, deoarece trei explică 79%, iar patru 86%.
- **0,20p:** minimum 90%: cinci axe, care explică 91%.
- **0,25p:** scoruri complete 80×8; soluția de 80%: 80×4.

Capcană: nu răspunde „Kaiser=3” memorând proiectul. Datele problemei sunt altele.

## 4. Loadings și matrice factor (1p)

- **0,40p:** corelațiile sunt în PCA$var$coord, în acest caz standardizat. sqrt(6,71396)≈2,5911; 0,3303×2,5911≈0,856, apropiat de 0,8558 din cauza rotunjirii loadingului.
- **0,35p:** sensul pozitiv al PC1 este asociat ocupării mai mari și șomajului / NEET mai reduse; se poate descrie integrarea pe piața muncii și incluziunea socială pe baza acestor variabile.
- **0,25p:** lambda nu se schimbă la inversarea semnului axei; se inversează împreună coeficienții și scorurile. Cos² și contribuțiile nu se schimbă.

## 5. Variables (1p)

- **0,35p:** X1 are corelație pozitivă 0,719 cu PC1; circa 51,6% din variația X1 este reprezentată pe PC1; X1 contribuie cu circa 7,69% la varianța axei PC1. Cele trei afirmații au sensuri diferite.
- **0,25p:** X12: 0,034+0,266≈0,300 în planul PC1–PC2. Citirea exclusiv în acest plan este incompletă; nu se deduce lipsa importanței pe alte axe.
- **0,20p:** referință=100/12=8,33%; X7 are 5,20% pe PC1, deci este sub referință. Referința nu este test statistic.
- **0,20p:** suma contribuțiilor pe o axă=100%; suma cos² pe toate axele pentru aceeași variabilă=1.

## 6. Individuals (1p)

- **0,25p:** Dim.2 pentru o observație este scor, fără limită impusă de −1/+1; limita este pentru corelații.
- **0,25p:** BE10 este distinct pe PC2, dar are variație/distanță importantă pe alte axe. Primul plan surprinde numai 47,9% din distanța pătratică totală; patru axe ajung la aproximativ 90,9%.
- **0,25p:** cos² pe PC2≈6,169²/9,006²≈0,469. Nu împarți la Dist simplă și nu confunzi cos² pe PC2 cu suma din plan.
- **0,25p:** referință=100/116≈0,862%. Cos² singur nu fixează contribuția: pentru calcul sunt necesare lambda, masa și scorul/distanța relevantă. Formula este 100×scor²/(116×lambda), pentru mase egale.

## 7. Cercul corelațiilor (1p)

- **0,20p:** PC1–PC2; 55,95%+14,39%≈70,34% din variația totală.
- **0,35p:** PC1 opune profilul digital, educațional, economic și de ocupare șomajului și NEET. Ocuparea și șomajul sunt în direcții opuse, sugerând asociere negativă, cu rezerva calității în plan.
- **0,25p:** X12 este slab/moderat reprezentată în acest plan, cu cos²≈0,300; poate fi reprezentată mai bine pe alte componente, în special PC3. Săgeată scurtă nu înseamnă variabilă inutilă.
- **0,20p:** cos2=calitatea reprezentării în plan; contrib=aport la axele afișate. Nu se atribuie sens de performanță culorilor.

## 8. Biplot și regiuni (1p)

- **0,25p:** în desenul vertical PC1 este pe Y; scorurile PC1 mai mari sunt în sus, în orientarea afișată.
- **0,25p:** codurile sunt regiuni; săgețile sunt indicatori. Se verifică scările, care sunt diferite în convenția biplotului princomp prezentat.
- **0,20p:** contează proiecția pe direcția săgeții, în scalarea graficului; nu distanța punct–vârf.
- **0,30p:** apropierea în plan nu garantează apropierea pe toate dimensiunile. Cos² arată cât de bine este reprezentată observația în plan, iar axele suplimentare pot diferenția regiunile.

## 9. Cod și comparații (1p)

- **0,30p:** primul grafic: variabilele / cercul corelațiilor pe PC3–PC4; al doilea: observațiile pe PC3–PC4. În ambele culoarea reprezintă cos² în plan, pentru tipul de obiect relevant.
- **0,20p:** 9,13%+5,59%≈14,72%; dreapta reprezintă PC3, deci nu se transferă automat semnificația digitalizării de pe PC1.
- **0,30p:** princomp$scores versus PCA$ind$coord; cor(X,princomp$scores) versus PCA$var$coord, pentru ACP standardizată. Se aliniază semnele axelor înainte de comparație; nu se compară direct loadings cu var$coord.
- **0,20p:** ncp controlează coordonatele păstrate în obiect. Numărul reținut pentru interpretare se justifică prin criterii, nu prin valoarea acestui argument.

## Interpretarea punctajului de antrenament

- **9–10:** verifică viteza și rezolvă din nou cu alte valori / semne.
- **7–8,99:** recitește numai secțiunile greșite și reformulează răspunsurile fără fișă.
- **Sub 7:** reia întâi recunoașterea obiectelor și diferența coordonată–scor–loading–cos²–contribuție.

Pentru fiecare item greșit, scrie un exemplu nou care ar duce la o concluzie diferită. Nu este suficient să memorezi rezultatul numeric din acest barem.
