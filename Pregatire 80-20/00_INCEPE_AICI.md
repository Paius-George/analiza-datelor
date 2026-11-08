# Începe aici — explicații de la zero

Vei vedea la test tabele și grafice. Treaba ta este să spui **ce arată și ce înseamnă**. Fișele sunt despre această interpretare, fără demonstrații sau programare.

## Mai întâi, traducem cuvintele

| Cuvânt | În proiectul tău |
|---|---|
| Observație / individ / entitate | O regiune, de exemplu RO11 |
| Variabilă / indicator | Ce măsurăm: șomaj, PIB, internet etc. |
| Output | Tabelul sau graficul afișat de R |
| Variație / dispersie | Cât de diferite sunt valorile între regiuni |
| Axă / componentă / PC / Dim | Un nou rezumat construit din indicatori |
| Plan PC1–PC2 | Graficul cu PC1 pe o axă și PC2 pe cealaltă |

Avem **116 regiuni și 12 indicatori**, toți pentru 2024. Comparăm regiuni în același an; acestea sunt **date de profil**. Codul și anul identifică datele, fără să intre ca indicatori în ACP.

## Ce face ACP, în cuvinte simple

Ai 12 lucruri de urmărit pentru fiecare regiune. ACP le combină în câteva rezumate numite **componente**.

- **PC1:** rezumatul care surprinde cele mai mari diferențe dintre regiuni.
- **PC2:** surprinde alte diferențe, pe care PC1 nu le-a surprins.
- **PC3 și PC4:** adaugă alte detalii.

Dacă PC1 explică 55,95%, înseamnă că rezumă 55,95% din variația totală a datelor. **Nu înseamnă că 55,95% dintre regiuni sunt bune sau că analiza are o probabilitate de corectitudine de 55,95%.**

## Cinci lucruri diferite

| Termen | Gândește-te la… | Întrebarea simplă |
|---|---|---|
| Loading | Ingredientele unui rezumat | Cu ce coeficient intră indicatorul în componentă? |
| Matrice factor | Legăturile indicator–componentă | Cât de legat este indicatorul de componentă? |
| Scor | Locul regiunii pe o axă | Unde se află regiunea? |
| Cos² | Cât se vede în rezumat | Cât de bine este reprezentat indicatorul sau regiunea? |
| Contribuție / ctr | Aportul la construirea axei | Cât ajută indicatorul sau regiunea la formarea axei? |

Explicațiile sunt ajutoare de memorie. Formulările exacte pentru test apar în fiecare fișă.

## Cum citești un exemplu

1. Citește **Ce vezi**.
2. Citește **Cum înțelegi**.
3. Ascunde răspunsul și spune-l singur.
4. Compară cu **La test poți spune**.

Ținta este să înțelegi propoziția, apoi să o spui în cuvintele tale.

## Ordinea fișelor

1. [Medii, distribuții și corelații](01_DESCRIPTIVE_SI_CORELATII.md).
2. [ACP: tabelele cu numere](02_ACP_OUTPUTURI_NUMERICE.md).
3. [Variabile și regiuni: Dim, cos², ctr](03_PCA_VARIABILE_SI_REGIUNI.md).
4. [Grafice explicate pe rând](04_GRAFICE_INTERPRETATE.md).
5. [Foaia scurtă pentru repetare](05_RECAPITULARE_RAPIDA.md).

## Ce înseamnă X1…X12 în exemple

| Cod | Indicator | Cod | Indicator |
|---|---|---|---|
| X1 | Internet acasă | X7 | Șomaj 20–64 ani |
| X2 | Internet zilnic | X8 | Șomaj tineri 15–24 ani |
| X3 | Internet banking | X9 | Studii superioare |
| X4 | Cumpărături online | X10 | Formare adulți |
| X5 | PIB/locuitor în PPS | X11 | NEET |
| X6 | Ocupare 20–64 ani | X12 | Densitate |

NEET înseamnă tineri neocupați care nu participă la educație sau formare. PPS permite compararea puterii de cumpărare. Fiecare regiune contează la fel în analiză, indiferent de populația sa.

La test, profesorul poate schimba numerele și indicatorii. Citești ce primești; nu atribui automat lui X1 aceeași denumire ca aici.
