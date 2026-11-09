# 4. Graficele — unde te uiți și ce spui

**De fiecare dată:** citești ce scrie pe axe, apoi legenda culorilor și a mărimilor. Abia după aceea interpretezi. Exemplele de mai jos folosesc datele și orientarea axelor din proiect.

## 1. Histogramă — unde se adună valorile?

**Unde te uiți:** jos sunt intervalele valorilor; înălțimea barelor arată numărul regiunilor sau densitatea, după etichetă.

**Cum înțelegi:** dacă multe valori sunt mici și câteva sunt foarte mari, desenul are o coadă lungă spre dreapta. Aceasta este asimetrie pozitivă.

**La test:** „PIB-ul și densitatea au distribuții asimetrice pozitiv: câteva regiuni au valori mult mai mari decât restul.”

**Reține:** coadă dreapta = câteva valori mari; coadă stânga = câteva valori mici. La ocupare, de exemplu, câteva regiuni au valori mult mai reduse. O histogramă aparent simetrică nu dovedește singură normalitatea.

![Histograme](imagini/01_histograme.png)

## 2. Boxplot — cutia și punctele din afară

**Unde te uiți:**

- Linia din cutie = mediana, adică mijlocul datelor ordonate.
- Cutia = jumătatea centrală a datelor.
- O cutie mai înaltă = valori centrale mai împrăștiate, pe aceeași scară.
- Punctele separate = valori potențial atipice.

**La test:** „Densitatea prezintă valori extreme ridicate. Acestea trebuie verificate, deoarece pot reflecta regiuni cu particularități reale.”

**Reține:** punct separat nu înseamnă automat eroare. Mustățile nu sunt obligatoriu minimul și maximul tuturor valorilor: observațiile din afara lor pot fi outlieri.

Regula folosește 1,5 ori lățimea intervalului central, pe baza balamalelor Tukey. Aceste limite pot diferi puțin de cuantilele descriptive.

![Boxplot](imagini/02_boxplot_original.png)

## 3. Boxplot standardizat — aceeași scară

**Cum înțelegi:** indicatorii au fost aduși la o scară comună. Acum vezi mai ușor ce valori sunt neobișnuite față de restul valorilor aceluiași indicator.

**La test:** „După standardizare, indicatorii sunt comparabili ca poziții relative. Densitatea păstrează extreme pozitive puternice.”

**Reține:** standardizarea schimbă scara, fără să șteargă extremele.

![Boxplot standardizat](imagini/03_boxplot_standardizat.png)

## 4. plot(X) — multe grafice mici

**Cum înțelegi:** fiecare căsuță compară două variabile. Verifici numele de pe rând și coloană ca să știi care sunt acelea.

**La test:** „Norii de puncte înclinați în sus sugerează asocieri pozitive, iar cei înclinați în jos asocieri negative, pentru perechile respective.”

**Reține:** fiecare căsuță are propria pereche de indicatori.

![Perechi de variabile](imagini/05_observatii_pairs.png)

## 5. Scatterplot — un punct pentru fiecare regiune

**Unde te uiți:** pe X este internetul zilnic; pe Y este PIB-ul. Un punct mai sus are PIB mai mare; un punct mai la dreapta are utilizare digitală mai mare.

**La test:** „Tendința ascendentă sugerează că regiunile cu utilizare zilnică mai mare a internetului tind să aibă PIB/locuitor mai ridicat.”

**Reține:** „tind să apară împreună”, fără a spune că internetul a provocat acel PIB.

![Internet și PIB](imagini/06_internet_PIB.png)

## 6. Corrplot — corelațiile desenate cu culori

**Unde te uiți:** alegi doi indicatori și citești celula lor, exact ca într-un tabel de corelație. Legenda spune ce înseamnă culoarea.

**La test:** „Ocuparea și NEET au corelație negativă puternică, aproximativ −0,839. Ocuparea ridicată tinde să fie asociată cu NEET redus.”

**Reține:** culoarea arată legătura; nu clasifică o regiune drept bună sau rea.

![Corelații](imagini/04_corelatii.png)

## 7. Trei variabile — poziție și culoare

**Cum citești:** dreapta = internet zilnic mai mare; sus = PIB mai mare; culoarea = ocupare, potrivit legendei.

**La test:** „Graficul arată simultan internetul zilnic, PIB-ul și ocuparea. Regiuni cu poziții apropiate pot avea ocupări diferite, vizibile prin culoare.”

![Trei variabile](imagini/07_trei_variabile.png)

## 8. Patru variabile — adaugi mărimea punctului

**Cum citești:** păstrezi cele trei informații și adaugi aria punctului, care aici arată studiile superioare.

**La test:** „Un punct mare reprezintă o regiune cu pondere ridicată a studiilor superioare. Poziția arată internetul și PIB-ul, iar culoarea ocuparea.”

**Reține:** în acest grafic, punct mare = mai multe studii superioare, fără să însemne populație mai mare.

![Patru variabile](imagini/08_patru_variabile.png)

## 9. Scree plot și fviz_eig — câte axe îți ajung?

**Unde te uiți:** pe X sunt componentele. Pe Y poate fi lambda sau procentul explicat: citești eticheta. Barele sau punctele mai înalte arată componente care explică mai mult.

**La test:** „Prima componentă explică 55,95% din variație. Primele patru explică 85,06%, deci sunt suficiente pentru pragul de 80%. Kaiser recomandă trei.”

**Reține:** mai întâi citești ce regulă cere problema. Când curba începe să se aplatizeze, axele următoare aduc mai puțină informație fiecare.

![Variație explicată](imagini/09_variatie.png)

## 10. Cercul corelațiilor PC1–PC2 — săgețile sunt indicatori

**Cum citești:** săgeata arată în ce sens este legat indicatorul de axe.

- Săgeți în direcții apropiate: indicatorii tind să fie asociați pozitiv.
- Săgeți în direcții opuse: tind să fie asociați negativ.
- Săgeți aproape perpendiculare: sugerează legătură liniară slabă, dacă sunt bine reprezentate.
- Săgeată lungă, aproape de cerc: vezi bine indicatorul în acest plan.
- Săgeată scurtă: planul arată doar o parte mică din indicator.

**La test:** „Planul explică 70,34%. Indicatorii digitali au direcții apropiate, iar NEET este în sens opus. PC1 descrie participarea digitală și integrarea economică și socială.”

**Reține:** când săgețile sunt scurte, interpretarea unghiurilor este nesigură. Perpendicular nu demonstrează independență.

![Cercul PC1–PC2](imagini/10_cerc_corelatii12.png)

## 11. Cercul PC3–PC4 — aceeași regulă, alte axe

**Cum înțelegi:** acum vezi alte două rezumate. Dreapta este PC3, nu PC1.

**La test:** „PC3 opune densitatea și PIB-ul formării adulților. PC4 opune accesul la internet studiilor superioare. Planul explică încă 14,72% din variație.”

![Cercul PC3–PC4](imagini/10b_cerc_corelatii34.png)

**Culorile în ambele cercuri:**

- `contrib` = cât ajută indicatorul la construirea axelor afișate.
- `cos2` = cât de bine este reprezentat indicatorul în plan.

Lungimea și culoarea pot arăta lucruri diferite. Citești legenda; o culoare nu înseamnă automat situație favorabilă.

## 12. Regiunile pe PC1–PC2 — punctele sunt regiuni

**Cum citești:** dreapta = scor PC1 mai mare; sus = scor PC2 mai mare. Dacă un punct este departe de zero, se distinge pe axele afișate.

**La test:** „Regiunile românești incluse au PC1 negativ, în sensul opus profilului favorabil descris de această axă. BE10 se distinge prin PC2 ridicat. Planul explică 70,34% din variație.”

**Reține:** punctele apropiate au scoruri apropiate în acest plan; pot diferi pe alte axe. Un punct aproape de zero poate avea totuși scoruri mari pe PC3 sau PC4.

Cu `col.ind="cos2"`, culoarea spune cât de bine vezi regiunea în acest plan, fără să spună cât de bogată este.

![Regiuni PC1–PC2](imagini/13_regiuni12.png)

## 13. Regiunile pe PC3–PC4 — detaliile suplimentare

**La test:** „Acest grafic arată diferențele suplimentare dintre regiuni pe axele 3 și 4. Regiuni apropiate în primul plan se pot separa aici.”

**Reține:** când schimbi axele, se schimbă și partea din profil pe care o vezi. Culoarea cos² este calitatea în noul plan.

![Regiuni PC3–PC4](imagini/14_regiuni34.png)

## 14. Biplot — puncte și săgeți împreună

**Cum citești:** punctele/codurile sunt regiuni, săgețile sunt indicatori. Verifici ce componentă este pe fiecare axă.

**La test:** „Dreapta corespunde PC1 mai mare, asociat participării digitale și integrării. Regiunile românești incluse se află în sensul negativ al acestei axe.”

Pentru legătura regiune–indicator, contează cât de mult avansează punctul în direcția săgeții, în scalarea biplotului. Termenul este **proiecție**. Nu alegi regiunea doar după apropierea de vârful săgeții.

**Reține:** punctele și săgețile pot avea scări diferite; nu le citești automat ca în cercul corelațiilor.

![Biplot](imagini/11_biplot.png)

## 15. Biplot vertical — ai schimbat locul axelor

**Cum citești:** PC1 este acum pe Y. Ce era „mai mult spre dreapta pe PC1” este acum „mai sus pe PC1”.

**La test:** „Profilul digital și economic mai favorabil este orientat în sus, deoarece PC1 este pe verticală. PC2 este pe orizontală. Rezultatele analizei sunt aceleași.”

![Biplot vertical](imagini/12_biplot_vertical.png)

## 16. Patru componente într-un singur grafic

| Ce privești | Ce afli aici |
|---|---|
| Poziția stânga–dreapta | Scorul PC1 |
| Poziția jos–sus | Scorul PC2 |
| Culoarea | Scorul PC3 |
| Mărimea crescătoare | Scorul PC4 |

**La test:** „Graficul reprezintă simultan primele patru componente, care explică 85,06%. Poziția arată PC1 și PC2, culoarea PC3, iar mărimea PC4.”

**Reține:** un punct mai mare are PC4 mai mare. Nu înseamnă automat situație mai bună sau populație mai mare. Doar pozițiile punctelor corespund celor 70,34% din primul plan; distanțele de pe ecran nu sunt distanțe complete în patru dimensiuni.

![Patru componente](imagini/16_primele_patru_componente.png)

[Înapoi](00_INCEPE_AICI.md) · [Urmează: repetare](05_RECAPITULARE_RAPIDA.md)
