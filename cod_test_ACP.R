# COD ACP - cele 5 cerinte din fotografia modelului de test
# Deschide in RStudio si foloseste Source. Datele proiectului sunt gasite automat.
# Prima linie din Excel trebuie sa contina numele coloanelor.
# Daca lipsesc pachetele, instaleaza-le o singura data din consola:
# Deschide instaleaza_test_ACP.R si foloseste Source o singura data.

pachete <- c("readxl", "FactoMineR", "factoextra", "corrplot")
lipsa <- pachete[!vapply(pachete, requireNamespace, logical(1), quietly = TRUE)]
if (length(lipsa) > 0) {
  stop("Foloseste Source pe instaleaza_test_ACP.R. Lipsesc: ", paste(lipsa, collapse = ", "))
}
library(readxl)
library(FactoMineR)
library(factoextra)
library(corrplot)

# 0. IMPORT SI SETARI ------------------------------------------------------
# Pentru Excelul profesorului, scrie aici calea lui; NULL foloseste proiectul.
fisier <- NULL
if (is.null(fisier)) {
  cale_script <- ""
  if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
    cale_script <- tryCatch(rstudioapi::getSourceEditorContext()$path,
                            error = function(e) "")
  }
  # Compatibil si cu source(".../cod_test_ACP.R") in afara RStudio.
  for (cadru in sys.frames()) {
    if (!is.null(cadru$ofile)) cale_script <- cadru$ofile
  }
  directoare <- unique(c(if (nzchar(cale_script)) dirname(cale_script), getwd()))
  for (i in seq_len(4)) directoare <- unique(c(directoare, dirname(directoare)))
  candidati <- unlist(lapply(directoare, function(d) c(
    file.path(d, "Rezolvare Seminar", "centralizare.xlsx"),
    file.path(d, "centralizare.xlsx")
  )), use.names = FALSE)
  gasite <- candidati[file.exists(candidati)]
  if (!length(gasite)) {
    stop("Pastreaza cod_test_ACP.R langa folderul Rezolvare Seminar cu centralizare.xlsx, sau completeaza fisier cu calea Excelului.")
  }
  fisier <- gasite[1]
}
cat("Date importate din:", normalizePath(fisier, mustWork = TRUE), "\n")
foaie <- 1
prag_variatie <- 80
coloana_regiune <- NULL  # NULL = prima coloana text; sau numele exact, ex. "Cod"
coloane_de_exclus <- c("an", "An", "AN")  # anul este metadatum; adauga aici ID-uri numerice

date <- as.data.frame(read_excel(fisier, sheet = foaie))
if (is.null(coloana_regiune)) {
  text <- names(date)[vapply(date, is.character, logical(1))]
  if (length(text) > 0) coloana_regiune <- text[1]
}
if (!is.null(coloana_regiune)) {
  if (!coloana_regiune %in% names(date)) stop("Coloana regiunilor nu exista.")
  etichete <- trimws(as.character(date[[coloana_regiune]]))
  goale <- is.na(etichete) | etichete == ""
  etichete[goale] <- paste0("Regiune_", which(goale))
  rownames(date) <- make.unique(etichete)
}

# In ACP intra numai indicatorii numerici. Verifica lista afisata!
# Daca ai un cod numeric de regiune, seteaza coloana_regiune la numele lui.
numerice <- names(date)[vapply(date, is.numeric, logical(1))]
indicatori <- setdiff(numerice, c(coloana_regiune, coloane_de_exclus))
X <- date[, indicatori, drop = FALSE]
if (nrow(X) < 3 || ncol(X) < 2) stop("Ai nevoie de minimum 3 regiuni si 2 indicatori.")
if (any(!is.finite(as.matrix(X)))) {
  stop("Exista valori lipsa sau infinite. Corecteaza importul/datele inainte de ACP.")
}
constante <- names(X)[vapply(X, function(x) sd(x) == 0, logical(1))]
if (length(constante) > 0) {
  stop("Exclude coloanele constante: ", paste(constante, collapse = ", "))
}
if (length(prag_variatie) != 1 || !is.finite(prag_variatie) ||
    prag_variatie <= 0 || prag_variatie > 100) stop("Pragul trebuie sa fie intre 0 si 100, exclusiv 0.")
cat("Indicatori inclusi in ACP:\n")
print(names(X))

# Formatul outputurilor urmeaza comenzile profesorului, ca in testele 11-20.
# Optiunile sunt restaurate la sfarsit; precizia nu modifica analiza.
optiuni_initiale <- options(width = 160, digits = 7)

# 1. MATRICEA DE CORELATIE (1p) --------------------------------------------
cat("\n1. Matricea de corelatie\n")
R <- cor(scale(X, center = TRUE, scale = TRUE))
print(round(R, 3))

# 2. DOUA CRITERII: OUTPUTUL summary(acp) (2p) -------------------------------
if (nrow(X) < ncol(X)) {
  stop("princomp, folosit de profesor, necesita cel putin atatea regiuni cat indicatori.")
}
acp <- princomp(X, cor = TRUE, scores = TRUE)
cat("\n2. Standard deviation / Proportion of Variance / Cumulative Proportion\n")
print(summary(acp))
# Standard deviation la patrat = lambda.
# Proportion of Variance si Cumulative Proportion sunt PROPORTII (0.80 = 80%).
# In tabelul Eigenvalues din summary(acp2), aceleasi informatii sunt procente.

# Pastreaza si obiectul FactoMineR pentru outputul standard de la exercitiul 4.
acp2 <- PCA(X, scale.unit = TRUE,
            ncp = min(5, ncol(X), nrow(X) - 1), graph = FALSE)
if (acp2$eig[2, 1] <= .Machine$double.eps * acp2$eig[1, 1]) {
  stop("Datele nu permit interpretarea unei a doua componente cu variatie pozitiva.")
}

# Pentru verificarea raspunsului, fara rotunjire inainte de selectie:
nr_kaiser <- sum(acp$sdev^2 > 1)
nr_cumulat <- which(acp2$eig[, 3] >= prag_variatie - 1e-10)[1]
cat("Kaiser (lambda > 1):", nr_kaiser, "componente.\n")
cat("Variatie cumulata, prag", prag_variatie, "%:", nr_cumulat,
    "componente; cumul =", round(acp2$eig[nr_cumulat, 3], 3), "%.\n")

# Salvam toate graficele in acelasi folder.
director_grafice <- file.path("rezultate", "grafice")
dir.create(director_grafice, recursive = TRUE, showWarnings = FALSE)
plot(acp, type = "l", main = "Scree plot - valori proprii")
png(file.path(director_grafice, "test_ACP_scree.png"),
    width = 1800, height = 1200, res = 160)
plot(acp, type = "l", main = "Scree plot - valori proprii")
dev.off()

# 3. MATRICEA FACTOR: INTERPRETAREA PC2 (2p) --------------------------------
scoruri <- acp$scores
MF <- cor(X, scoruri)
cat("\n3. Matricea factor (Comp.1, Comp.2, ...)\n")
print(round(MF, 3))
corrplot(MF, method = "number")
png(file.path(director_grafice, "test_ACP_matrice_factor.png"),
    width = 2200, height = 1800, res = 180)
corrplot(MF, method = "number")
dev.off()
cat("PC2 explica", round(acp2$eig[2, 2], 3), "% din variatia totala.\n")
# Interpreteaza coloana Comp.2: semne, valori mari in modul, apoi denumire.
# Ca in codul profesorului, MF provine din princomp; graficul final din PCA.
# Semnele unei axe pot fi opuse intre metode. Pentru profilul regiunilor din
# grafic foloseste corelatiile Dim.1 / Dim.2 din summary(acp2), de mai jos.

# 4. OUTPUTUL STANDARD FactoMineR (2p) -------------------------------------
cat("\n4. Outputul FactoMineR, ca in variantele de test\n")
print(acp2)
summary(acp2)
# Afiseaza Eigenvalues, Individuals si Variables, cu Dim, ctr si cos2.
# Implicit vezi primele 10 elemente si primele 3 axe disponibile.
# Pentru TOATE variabilele si numai primele doua axe, optional:
# summary(acp2, nbelements = ncol(X), ncp = 2)
# Variables: Dim = corelatie; ctr = contributie (%); cos2 = calitatea reprezentarii.
# Individuals: Dim = SCOR al regiunii; ctr si cos2 au sens pentru regiuni.
cat("Contributia medie (100 / numarul TOTAL al indicatorilor):",
    round(100 / ncol(X), 3), "% pe componenta.\n")

# 5. GRAFICUL REGIUNILOR SI DOUA CONCLUZII (2p) -----------------------------
grafic_regiuni <- fviz_pca_ind(
  acp2, axes = c(1, 2), repel = TRUE, col.ind = "cos2",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  title = "Reprezentarea regiunilor in planul PC1 - PC2"
) + ggplot2::labs(
  x = sprintf("Componenta 1 (%.2f%%)", acp2$eig[1, 2]),
  y = sprintf("Componenta 2 (%.2f%%)", acp2$eig[2, 2])
)
print(grafic_regiuni)  # afisare inclusiv cand folosesti Source

director_grafice <- file.path("rezultate", "grafice")
dir.create(director_grafice, recursive = TRUE, showWarnings = FALSE)
ggplot2::ggsave(file.path(director_grafice, "test_ACP_regiuni_PC1_PC2.png"),
                plot = grafic_regiuni, width = 12, height = 9, dpi = 300)
cat("\nGrafic salvat in:", normalizePath(director_grafice), "\n")

tabel_ind <- data.frame(
  Scor_PC1 = acp2$ind$coord[, 1],
  Scor_PC2 = acp2$ind$coord[, 2],
  cos2_plan = rowSums(acp2$ind$cos2[, 1:2, drop = FALSE])
)
cat("\n5. Cele mai mari doua scoruri pe PC1\n")
print(round(head(tabel_ind[order(-tabel_ind$Scor_PC1), ], 2), 3))
cat("\nCele mai mici doua scoruri pe PC1\n")
print(round(head(tabel_ind[order(tabel_ind$Scor_PC1), ], 2), 3))
cat("\nCele mai mari doua scoruri pe PC2\n")
print(round(head(tabel_ind[order(-tabel_ind$Scor_PC2), ], 2), 3))
cat("\nCele mai mici doua scoruri pe PC2\n")
print(round(head(tabel_ind[order(tabel_ind$Scor_PC2), ], 2), 3))
# Scorurile regiunilor sunt coordonate, NU corelatii.
# cos2_plan = calitatea reprezentarii regiunii in planul PC1-PC2.
# Exemplu: 0.90 = 90% din distanta patrata fata de origine este surprinsa aici.
# Concluzia 1: compara regiuni pe PC1 folosind acp2$var$coord[, 1].
# Concluzia 2: compara regiuni pe PC2 folosind acp2$var$coord[, 2].
# Verifica cos2_plan inainte sa formulezi concluzii ferme despre o regiune.
# Pentru o regiune anume: tabel_ind["numele_regiunii", , drop = FALSE]

options(optiuni_initiale)

# Comentariile de mai jos nu se executa si nu modifica outputurile.
# Restrange selectia: Alt+L; redeschide: Shift+Alt+L (RStudio Windows/Linux).
# Sunt raspunsuri pentru centralizare.xlsx; adapteaza-le pentru alte date.

# INTERPRETARI COMPLETE - DATELE PROIECTULUI ----
# REZOLVARE COMPLETĂ — MODELUL DE TEST DIN FOTOGRAFIE
# Date: centralizare.xlsx, prima foaie; 116 regiuni, 12 indicatori (X1–X12).
# Fișier asociat: cod_test_ACP.R. Coloana „an” este exclusă din analiză.
#
# Aceste răspunsuri se referă la DATELE PROIECTULUI NOSTRU. La testul profesorului
# păstrezi logica formulării și înlocuiești valorile, numele și concluziile cu cele
# susținute de outputul primit. Variantele 11–20 au alte date și alte rezultate.
# Calculele numerice de aici au fost verificate independent în Python; scriptul R
# nu a fost executat. Valorile afișate mai jos sunt rotunjite.
#
# Semnele folosite: PC1 are corelații pozitive cu indicatorii digitali, iar PC2 are
# corelație pozitivă cu șomajul. Verifică semnele în propriul output: dacă o axă
# este inversată, inversezi și sensul interpretării, păstrând procentele explicate.

# 1. MATRICEA DE CORELAȚIE ȘI JUSTIFICAREA ACP — 1 punct ----
# Enunț: Analizați matricea de corelație pentru datele numerice inițiale.
# Formulați o concluzie privind aplicarea analizei componentelor principale.
#
# RĂSPUNS DE SCRIS:
#
# Între internetul acasă (X1) și internetul zilnic (X2) există o corelație pozitivă
# puternică, r = 0,732. Regiunile cu o pondere mai mare a accesului la internet
# acasă tind să aibă și o pondere mai mare a utilizării zilnice a internetului.
#
# Între ocupare (X6) și șomaj (X7) există o corelație negativă puternică,
# r = -0,739. Regiunile cu o rată a ocupării mai ridicată tind să aibă o rată
# a șomajului mai redusă.
#
# Matricea conține 37 de perechi distincte cu |r| > 0,50, din 66 de perechi
# posibile. Existența mai multor corelații ridicate în valoare absolută indică
# informație comună între indicatori și susține utilitatea ACP pentru reducerea
# dimensionalității, prin sintetizarea informației în mai puține componente.
# Corelațiile descriu asocieri și nu demonstrează relații de cauzalitate.

# 2. DOUĂ CRITERII PENTRU NUMĂRUL DE COMPONENTE — 2 puncte ----
# Enunț: Folosiți două criterii pentru a decide numărul de componente păstrate
# în analiză.
#
# VALORILE PE CARE LE CITEȘTI:
#
# Componenta    Valoare proprie    Variație explicată (%)    Cumulat (%)
# PC1           6,714              55,950                    55,950
# PC2           1,727              14,389                    70,339
# PC3           1,096              9,132                     79,471
# PC4           0,670              5,587                     85,058
# PC5           0,539              4,492                     89,550
#
# RĂSPUNS DE SCRIS:
#
# Conform criteriului Kaiser, aplicat ACP pe indicatori standardizați, păstrăm
# componentele cu valori proprii strict mai mari decât 1. PC1 are λ = 6,714,
# PC2 are λ = 1,727, iar PC3 are λ = 1,096. PC4 are λ = 0,670 < 1, iar valorile
# următoare sunt și mai mici. Prin urmare, criteriul Kaiser recomandă păstrarea
# primelor 3 componente, care explică împreună 79,471% din variația totală.
#
# Conform criteriului variației cumulate explicate, la un prag ales de 80%,
# păstrăm primele 4 componente. Primele 3 explică numai 79,471%, sub prag, iar
# primele 4 explică 85,058%, depășind pentru prima dată pragul impus.
#
# Cele două criterii conduc la recomandări diferite: 3 componente după Kaiser
# și 4 componente pentru atingerea pragului de 80%. Dacă obiectivul este
# păstrarea a minimum 80% din variația totală, alegem 4 componente.
#
# DE REȚINUT:
# - În summary(acp): λ = (Standard deviation)^2.
# - Cumulative Proportion = 0,85058 înseamnă 85,058%.
# - În Eigenvalues: Variance înseamnă λ; Cumulative % of var. este deja procent.
# - ncp = 5 din cod nu este criteriu de selecție.
# - Păstrăm componente, nu indicatorii inițiali.

# 3. MATRICEA FACTOR: INTERPRETAREA COMPONENTEI A DOUA — 2 puncte ----
# Enunț: Folosiți matricea factor pentru a interpreta a doua componentă principală.
#
# RĂSPUNS DE SCRIS:
#
# Matricea factor conține corelațiile dintre indicatorii inițiali și componente.
# Componenta a doua este corelată pozitiv, în principal, cu șomajul (X7,
# r = 0,694), șomajul tinerilor (X8, r = 0,546), densitatea populației (X12,
# r = 0,515) și studiile superioare (X9, r = 0,490). Ea este corelată negativ
# cu ocuparea (X6, r = -0,378). PIB-ul pe locuitor are o asociere pozitivă
# mai redusă, r = 0,348.
#
# Un scor pozitiv ridicat pe PC2 sugerează un profil cu șomaj general și al
# tinerilor mai ridicat, densitate și pondere a studiilor superioare mai mari,
# în opoziție cu o rată a ocupării mai redusă. Pentru un scor negativ, sensul
# profilului se inversează. Acestea sunt tendințe ale profilului, nu condiții
# obligatorii pentru fiecare regiune și fiecare indicator.
#
# Componenta poate fi numită „Contrast între șomaj, densitate, educație și ocupare”.
# Ea explică 14,389% din variația totală, valoare citită pentru PC2 în rândul
# % of var. din Eigenvalues, respectiv 0,14389 în Proportion of Variance.
# Un scor pozitiv pe această componentă nu înseamnă automat o situație mai bună.
#
# IMPORTANT: Faptul că șomajul și studiile superioare au același semn pe PC2
# nu dovedește singur o corelație pozitivă globală între cei doi indicatori.
# Corelația globală se citește din matricea de corelație a indicatorilor.

# 4. INTERPRETAREA COLOANELOR Dim.1, Dim.2 ȘI ctr — 2 puncte ----
# Enunț: Din outputul numeric privind variabilele interpretați coloanele Dim1,
# Dim2 (corelații) și ctr (contribuții) pentru primele două componente principale.
#
# RĂSPUNS DE SCRIS — INTRODUCERE:
#
# În secțiunea Variables, Dim.1 și Dim.2 reprezintă corelațiile indicatorului
# cu PC1, respectiv PC2. Semnul arată sensul asocierii, iar valoarea absolută
# arată intensitatea. Corelația se exprimă ca r între -1 și 1.
#
# Coloana ctr reprezintă contribuția procentuală a indicatorului la construirea
# componentei respective. Pentru fiecare componentă, contribuțiile tuturor celor
# 12 indicatori însumează 100%. Reperul contribuției medii este 100/12 = 8,333%.
# Contribuția este pozitivă chiar dacă indicatorul are corelație negativă cu axa.
#
# INTERPRETĂRI COMPLETE, PENTRU ORICARE INDICATOR CERUT:
#
# X1 — Internet acasă:
# Corelația cu PC1 este r = 0,719, iar corelația cu PC2 este
# r = 0,131. Indicatorul contribuie cu 7,691% la construirea PC1
# și cu 0,999% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Asocierea cu PC2 este foarte slabă; evităm concluzii ferme pe această axă.
#
# X2 — Internet zilnic:
# Corelația cu PC1 este r = 0,819, iar corelația cu PC2 este
# r = 0,199. Indicatorul contribuie cu 9,992% la construirea PC1
# și cu 2,283% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Asocierea cu PC2 este foarte slabă; evităm concluzii ferme pe această axă.
#
# X3 — Internet banking:
# Corelația cu PC1 este r = 0,885, iar corelația cu PC2 este
# r = 0,106. Indicatorul contribuie cu 11,665% la construirea PC1
# și cu 0,655% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Asocierea cu PC2 este foarte slabă; evităm concluzii ferme pe această axă.
#
# X4 — Cumpărături online:
# Corelația cu PC1 este r = 0,901, iar corelația cu PC2 este
# r = -0,025. Indicatorul contribuie cu 12,094% la construirea PC1
# și cu 0,036% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Asocierea cu PC2 este foarte slabă; evităm concluzii ferme pe această axă.
#
# X5 — PIB pe locuitor (PPS):
# Corelația cu PC1 este r = 0,654, iar corelația cu PC2 este
# r = 0,348. Indicatorul contribuie cu 6,374% la construirea PC1
# și cu 7,009% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# X6 — Ocupare 20–64 ani:
# Corelația cu PC1 este r = 0,856, iar corelația cu PC2 este
# r = -0,378. Indicatorul contribuie cu 10,907% la construirea PC1
# și cu 8,293% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai reduse ale indicatorului.
#
# X7 — Șomaj 20–64 ani:
# Corelația cu PC1 este r = -0,591, iar corelația cu PC2 este
# r = 0,694. Indicatorul contribuie cu 5,202% la construirea PC1
# și cu 27,906% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai reduse ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# X8 — Șomaj în rândul tinerilor:
# Corelația cu PC1 este r = -0,729, iar corelația cu PC2 este
# r = 0,546. Indicatorul contribuie cu 7,909% la construirea PC1
# și cu 17,276% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai reduse ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# X9 — Studii superioare:
# Corelația cu PC1 este r = 0,717, iar corelația cu PC2 este
# r = 0,490. Indicatorul contribuie cu 7,657% la construirea PC1
# și cu 13,896% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# X10 — Formare adulți:
# Corelația cu PC1 este r = 0,721, iar corelația cu PC2 este
# r = 0,312. Indicatorul contribuie cu 7,752% la construirea PC1
# și cu 5,628% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# X11 — NEET:
# Corelația cu PC1 este r = -0,907, iar corelația cu PC2 este
# r = 0,105. Indicatorul contribuie cu 12,250% la construirea PC1
# și cu 0,638% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai reduse ale indicatorului.
# Asocierea cu PC2 este foarte slabă; evităm concluzii ferme pe această axă.
#
# X12 — Densitatea populației:
# Corelația cu PC1 este r = 0,184, iar corelația cu PC2 este
# r = 0,515. Indicatorul contribuie cu 0,506% la construirea PC1
# și cu 15,381% la construirea PC2.
# Scorurile mari pe PC1 se asociază cu valori mai ridicate ale indicatorului.
# Scorurile mari pe PC2 se asociază cu valori mai ridicate ale indicatorului.
#
# CONCLUZIE PENTRU CERINȚA 4:
#
# De exemplu, șomajul contribuie cu 27,906% la PC2, mult peste reperul de 8,333%,
# și are corelația r = 0,694 cu această componentă. NEET contribuie cu 12,250%
# la PC1, având corelația negativă r = -0,907. Așadar, un indicator poate avea
# contribuție importantă atât cu o corelație pozitivă, cât și cu una negativă.
#
# Dacă apare și cos2: acesta măsoară calitatea reprezentării, nu contribuția.
# Pentru variabilele din această ACP standardizată, cos2 pe o axă este r^2.
# În secțiunea Individuals, Dim este scorul regiunii, nu o corelație.
# summary(acp2) arată implicit primele 10 variabile, dar reperul rămâne 100/12.

# 5. GRAFICUL REGIUNILOR ÎN PLANUL PC1–PC2. DOUĂ CONCLUZII — 2 puncte ----
# Enunț: Reprezentați grafic regiunile într-un spațiu definit de primele două
# componente principale. Extrageți 2 concluzii.
#
# REPREZENTAREA CERUTĂ:
#
# În R, graficul este produs de fviz_pca_ind(acp2). Axa orizontală reprezintă
# PC1, iar axa verticală PC2. Primele două componente explică împreună 70,339%
# din variația totală (55,950% + 14,389%). Scorurile sunt coordonate ale
# regiunilor și pot depăși intervalul [-1, 1].
#
# VALORI UTILE DIN GRAFIC ȘI TABELUL SCORURILOR:
#
# Regiune    Scor PC1    Scor PC2    cos2 în planul PC1–PC2
# NL35       5,117       0,586       0,977
# ITF6       -7,916      1,544       0,931
# DK01       4,129       1,631       0,923
# RO21       -3,705      -2,030      0,834
# BE10       0,878       6,169       0,479
# CZ05       0,294       -2,587      0,756
#
# RĂSPUNS DE SCRIS — CELE DOUĂ CONCLUZII:
#
# 1) NL35 se află mult în dreapta originii, având scorul PC1 = 5,117, în timp ce
# ITF6 se află mult în stânga, cu PC1 = -7,916. Având în vedere corelațiile PC1,
# NL35 tinde să aibă un profil cu digitalizare și ocupare mai ridicate, respectiv
# șomaj și NEET mai reduse, în comparație cu profilul opus al ITF6. Cele două
# regiuni sunt bine reprezentate în plan: cos2 cumulat este 0,977 pentru NL35
# și 0,931 pentru ITF6, adică aproximativ 97,7% și 93,1% din distanța pătratică
# față de centru sunt surprinse de planul PC1–PC2.
#
# 2) DK01 are un scor pozitiv pe PC2 (1,631), iar RO21 are un scor negativ
# (-2,030). Pe această axă, profilul DK01 este orientat spre valori mai ridicate
# ale șomajului, densității și studiilor superioare, în opoziție cu ocuparea,
# iar profilul RO21 este orientat în sens invers. Formularea exprimă tendința
# sintetizată de PC2; nu afirmă că fiecare indicator al DK01 este obligatoriu
# mai mare sau mai mic decât cel al RO21. Calitatea reprezentării în plan este
# bună pentru ambele: cos2 cumulat = 0,923 pentru DK01 și 0,834 pentru RO21.
#
# OBSERVAȚIE SUPLIMENTARĂ, DACĂ ÎȚI ESTE CERUTĂ REGIUNEA BE10:
#
# BE10 se distinge printr-un scor PC2 foarte ridicat (6,169), dar cos2 cumulat
# în plan este numai 0,479. Planul surprinde aproximativ 47,9% din distanța sa
# pătratică față de centru, deci interpretarea profilului numai pe aceste două
# axe trebuie făcută prudent. Faptul că planul explică 70,339% din variația
# totală a setului nu garantează aceeași calitate pentru fiecare regiune.

# CUM ADAPTEZI ACESTE RĂSPUNSURI LA ALTE DATE ----
# 1) Corelații: citează două perechi, semnul și sensul asocierii; justifică ACP.
# 2) Kaiser: numără lambda > 1. Prag: primul cumul care atinge procentul ales.
# 3) PC2: selectează corelațiile mari în modul, explică semnele, dă o denumire
#    și citează procentul explicat NUMAI de componenta a doua.
# 4) Variabile: Dim = corelație; ctr = contribuție procentuală; cos2 = calitatea
#    reprezentării. Citează valori pentru ambele componente cerute.
# 5) Regiuni: identifică poziția prin scor, explică profilul prin corelațiile
#    componentei și verifică suma cos2 pentru plan. Scrie două concluzii concrete.
#
# Nu transfera automat valorile, denumirile componentelor sau profilurile de mai
# sus într-o variantă cu alte date. Interpretează semnele efectiv afișate.

# SFARSIT INTERPRETARI ----
