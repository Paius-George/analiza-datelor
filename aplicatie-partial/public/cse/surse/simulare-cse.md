# Simulare de parțial — Cibernetica sistemelor economice

Încearcă să rezolvi prima parte fără să consulți baremul.

## Subiecte

### I. Teorie — 2 puncte

**1. (1 punct)** Prezentați pe scurt Sistemul 2 și Sistemul 3 din Modelul Sistemului Viabil și precizați diferența dintre ele.

**2. (1 punct)** Explicați de ce banca este un sistem adaptiv complex, folosind conectivitatea, interdependența și încă o proprietate la alegere.

### II. Probleme — 2 puncte

**3. PSI și semafor (1 punct)**

Pentru un portofoliu există următoarele numere de clienți:

| Clasă | Bază | Curent |
|---|---:|---:|
| A | 50 | 40 |
| B | 30 | 35 |
| C | 20 | 25 |

Calculați PSI și interpretați rezultatul prin tehnica semaforului.

**4. HHI și entropie (1 punct)**

Un portofoliu are ponderile \(z=(0,50; 0,30; 0,20)\). Calculați HHI brut, HHI normalizat și entropia Shannon normalizată. Aplicați semaforul.

### III. Întrebări rapide de antrenament

5. Într-o fabrică, trei departamente își fac separat programul, provocând timpi de așteptare și suprasolicitare. Ce sistem VSM este deficitar?

6. Conducerea realocă bugetul și personalul pentru a optimiza rezultatul întregii fabrici. Ce sistem VSM acționează?

7. Un departament execută efectiv serviciul oferit clientului. Ce sistem VSM este?

8. O firmă colectează comenzi, estimează cererea și face reclamă. Ce subsistem cibernetic al firmei este?

9. O firmă analizează costurile, prețurile și profitabilitatea tehnologiei. Ce subsistem este?

10. Explicați în două propoziții coevoluția dintre bancă și clienții săi.

11. Dați patru exemple de instituții sau vehicule din shadow banking.

12. Care este diferența dintre adaptare, învățare și auto-organizare?

13. Dacă \(PSI=0,18\), ce culoare și ce acțiune rezultă?

14. Dacă \(HHI_{norm}=0,23\), ce culoare și ce interpretare rezultă?

15. Dacă \(H_{norm}=0,92\), ce culoare și ce interpretare rezultă?

---

# Barem și rezolvări

## 1. S2 și S3

S2 coordonează unitățile S1, reduce conflictele și oscilațiile și menține stabilitatea. S3 supraveghează ansamblul operațional, alocă resurse și optimizează activitatea internă. Diferența: **S2 stabilizează interacțiunile, S3 optimizează întregul**.

## 2. Banca drept CAS

Creditarea, depozitele, trezoreria, lichiditatea și capitalul sunt conectate prin fluxuri financiare și informaționale. Sunt interdependente deoarece o modificare a creditării schimbă riscul, finanțarea și capitalul. Ca a treia proprietate poate fi folosită adaptarea, feedbackul, emergența sau dependența de traiectorie, cu un exemplu concret.

## 3. PSI

Distribuția de bază este deja normalizată prin totalul 100:

\[
p=(0,50;0,30;0,20)
\]

Distribuția curentă are tot totalul 100:

\[
q=(0,40;0,35;0,25)
\]

\[
PSI=(0,50-0,40)\ln(0,50/0,40)
 +(0,30-0,35)\ln(0,30/0,35)
 +(0,20-0,25)\ln(0,20/0,25)
\]

Contribuții aproximative:

- A: \(0,10\times0,223144=0,022314\);
- B: \((-0,05)\times(-0,154151)=0,007708\);
- C: \((-0,05)\times(-0,223144)=0,011157\).

\[
PSI\approx0,04118
\]

Deoarece \(PSI<0,10\), rezultatul este **Verde — abateri mici/populație stabilă; monitorizare obișnuită**.

## 4. HHI și entropie

### HHI

\[
HHI=0,50^2+0,30^2+0,20^2=0,38
\]

Pentru \(n=3\):

\[
HHI_{norm}=\frac{3\times0,38-1}{3-1}=0,07
\]

Rezultat: **Verde — concentrare redusă** conform pragurilor seminarului.

### Entropie

\[
H=-[0,50\ln(0,50)+0,30\ln(0,30)+0,20\ln(0,20)]\approx1,02965
\]

\[
H_{norm}=\frac{1,02965}{\ln(3)}\approx0,93723
\]

Rezultat: **Verde — diversificare ridicată**.

## 5–15. Răspunsuri rapide

5. **S2**, deoarece lipsește coordonarea dintre unitățile operaționale.
6. **S3**, deoarece sunt alocate resurse pentru optimizarea întregului.
7. **S1**, activitatea primară.
8. **SRPB**, subsistemul raporturilor cu piața.
9. **SPCP**, subsistemul prețuri–costuri–profitabilitate.
10. Banca își schimbă politica în funcție de comportamentul și riscul clienților. Clienții reacționează la noua politică, iar reacția lor modifică din nou cererea și riscul observate de bancă.
11. Fonduri de piață monetară, hedge funds, companii financiare nebancare, broker-dealeri, SPV-uri de securitizare, companii ipotecare sau platforme P2P — oricare patru.
12. **Adaptare** = se schimbă comportamentul/echipa deservită; **învățare** = se schimbă competența pe baza experienței; **auto-organizare** = repartizarea/ordinea rezultă din interacțiuni locale, fără optimizare centrală globală.
13. **Galben** — schimbare relevantă/moderată; se investighează segmentele și variabilele.
14. **Roșu** — concentrare ridicată; analiză aprofundată și plan de acțiune.
15. **Verde** — diversificare ridicată; monitorizare obișnuită.

