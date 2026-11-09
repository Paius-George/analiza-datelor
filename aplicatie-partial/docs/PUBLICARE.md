# Publicare cu acces aprobat

Codul este găzduit în `Paius-George/analiza-datelor`, iar site-ul rulează în contul Cloudflare al proprietarului. GitHub Pages nu se activează pentru acest proiect.

## 1. Repository privat

În [Settings](https://github.com/Paius-George/analiza-datelor/settings), mergi la **Danger Zone → Change repository visibility → Make private** dacă repository-ul mai este public. Un repository public permite descărcarea materialelor și a aplicației, indiferent de protecția site-ului. Schimbarea vizibilității nu retrage copiile deja făcute.

Nu este necesar să inviți colegii drept colaboratori GitHub. Ei au nevoie doar de acces la site.

## 2. Cont Cloudflare și prima publicare blocată

1. Creează sau folosește contul tău la [Cloudflare](https://dash.cloudflare.com/).
2. În **Workers & Pages**, configurează subdomeniul `workers.dev` al contului, dacă ți se solicită. Nu este necesar un domeniu cumpărat.
3. Copiază **Account ID** din pagina contului.
4. Din [API Tokens](https://dash.cloudflare.com/profile/api-tokens), creează un token pornind de la șablonul **Edit Cloudflare Workers**, restrâns la contul în care publici. Nu pune tokenul în cod sau în chat.
5. În [GitHub → Settings → Secrets and variables → Actions](https://github.com/Paius-George/analiza-datelor/settings/secrets/actions), adaugă două **repository secrets**:

| Nume | Valoare |
| --- | --- |
| `CLOUDFLARE_API_TOKEN` | Tokenul Cloudflare |
| `CLOUDFLARE_ACCOUNT_ID` | Account ID |

6. În fila [Variables](https://github.com/Paius-George/analiza-datelor/settings/variables/actions), adaugă variabila `CLOUDFLARE_DEPLOY_ENABLED` cu valoarea `true`.
7. În [Actions](https://github.com/Paius-George/analiza-datelor/actions), deschide **Aplicație — verificare și publicare → Run workflow**, pe branchul `main`.

Workflow-ul testează, construiește și publică Workerul `analiza-datelor`. URL-ul va apărea în pasul de publicare și în Cloudflare. În această etapă site-ul răspunde cu **503**, fără lecții sau fișiere: autentificarea nu este încă configurată.

## 3. Activează autentificarea și aprobă adresele

1. În Cloudflare, deschide **Zero Trust** și finalizează configurarea organizației. Alege planul potrivit numărului tău de utilizatori și verifică limitele afișate înainte să confirmi planul.
2. În **Settings → Authentication → Login methods**, adaugă **One-time PIN**, dacă nu este deja disponibil.
3. În **Workers & Pages → analiza-datelor → Access**, alege **Protect this Worker behind Access → All traffic**. Protecția trebuie să includă producția, nu doar preview-urile.
4. Creează o politică **Allow** cu **Include → Emails** și adaugă adresa ta și adresele individuale ale colegilor aprobați. Pentru autentificare selectează **One-time PIN**. Alege, de exemplu, o sesiune de 8 ore.
5. Nu adăuga reguli **Everyone**, **Bypass** sau o regulă care permite orice adresă doar fiindcă folosește One-time PIN. Nu aproba întreg domeniul facultății dacă vrei confirmare individuală.
6. În **Zero Trust → Access → Applications**, deschide aplicația creată pentru Worker. Copiază **Application Audience (AUD) Tag**. Domeniul organizației are forma `echipa-ta.cloudflareaccess.com` și poate fi găsit în setările Zero Trust.
7. În GitHub, adaugă două **repository variables**:

| Nume | Valoare |
| --- | --- |
| `ACCESS_TEAM_DOMAIN` | `echipa-ta.cloudflareaccess.com`, fără `https://` și fără slash |
| `ACCESS_AUD` | AUD al aplicației, 64 de caractere hexazecimale |

8. Rulează din nou workflow-ul. Acum colegii aprobați se pot conecta folosind codurile primite pe e-mail.

Configurația Workerului verifică tokenurile semnate înainte de orice pagină, bundle JavaScript, imagine, font sau fișă. Dezactivarea accidentală a Access nu face publice materialele: fără token valid Workerul refuză cererea.

## 4. Verificare înainte să distribui linkul

- Într-o fereastră incognito apare autentificarea Cloudflare înaintea aplicației.
- Adresa ta aprobată primește cod și poate deschide aplicația, lecțiile și graficele.
- O adresă neaprobată nu poate intra.
- Un link direct precum `/materiale/00_INCEPE_AICI.md` sau `/theory/images/01_histograme.png` cere și el autentificare într-o fereastră incognito.
- Repository-ul GitHub este privat.

## Adăugarea și retragerea accesului

Pentru un coleg nou, editează politica Cloudflare și adaugă adresa lui în **Emails**. Nu trebuie să reconstruiești aplicația.

Pentru retragerea accesului, elimină adresa din politică și revocă sesiunile utilizatorului din Cloudflare Access. O sesiune deja emisă poate rămâne valabilă până la expirare dacă doar modifici lista. Nu distribui colegilor tokenul API sau accesul de administrator la conturi.

Distribuirea linkului nu autorizează o adresă nouă. Un utilizator aprobat poate totuși transmite codul/sesiunea sau copia materialele deja primite; această configurație nu previne complet redistribuirea.

## Surse

- [Cloudflare Access pentru Workers](https://developers.cloudflare.com/workers/configuration/cloudflare-access/)
- [One-time PIN](https://developers.cloudflare.com/cloudflare-one/integrations/identity-providers/one-time-pin/)
- [Verificarea tokenurilor](https://developers.cloudflare.com/cloudflare-one/access-controls/applications/http-apps/authorization-cookie/validating-json/)
- [Worker înaintea fișierelor statice](https://developers.cloudflare.com/workers/static-assets/routing/worker-script/)
