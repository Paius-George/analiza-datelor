# COD ACP - cele 5 cerinte din fotografia modelului de test
# Deschide in RStudio si foloseste Source. Datele proiectului sunt gasite automat.
# Prima linie din Excel trebuie sa contina numele coloanelor.
# Daca lipsesc pachetele, instaleaza-le o singura data din consola:
# Deschide instaleaza_test_ACP.R si foloseste Source o singura data.

pachete <- c("readxl", "FactoMineR", "factoextra")
lipsa <- pachete[!vapply(pachete, requireNamespace, logical(1), quietly = TRUE)]
if (length(lipsa) > 0) {
  stop("Foloseste Source pe instaleaza_test_ACP.R. Lipsesc: ", paste(lipsa, collapse = ", "))
}
library(readxl)
library(FactoMineR)
library(factoextra)

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

# 1. MATRICEA DE CORELATIE (1p) --------------------------------------------
cat("\n1. Matricea de corelatie\n")
R <- cor(X)
print(round(R, 3))
# Alege exemple de corelatii pozitive/negative si explica sensul lor.
# Corelatii puternice in valoare absoluta -> informatie comuna -> ACP utila.
# Corelatia nu dovedeste o relatie cauza-efect.

# O singura analiza pentru toate tabelele si graficul: semne consecvente.
# ncp stabileste cate axe au scoruri calculate; NU este decizia de la ex. 2.
acp <- PCA(X, scale.unit = TRUE,
           ncp = min(5, ncol(X), nrow(X) - 1), graph = FALSE)
if (acp$eig[2, 1] <= .Machine$double.eps * acp$eig[1, 1]) {
  stop("Datele nu permit interpretarea unei a doua componente cu variatie pozitiva.")
}

# 2. NUMARUL DE COMPONENTE: DOUA CRITERII (2p) ------------------------------
cat("\n2. Valori proprii, variatie explicata (%), variatie cumulata (%)\n")
print(round(acp$eig, 3))
# Coloana 1 = lambda (valoare proprie), egala cu abaterea standard la patrat.
# Coloana 2 = procentul explicat de fiecare componenta separat.
# Coloana 3 = procentul cumulat de la PC1 pana la componenta respectiva.

nr_kaiser <- sum(acp$eig[, 1] > 1)
nr_cumulat <- which(acp$eig[, 3] >= prag_variatie - 1e-10)[1]
cat("Kaiser (lambda > 1):", nr_kaiser, "componente.\n")
cat("Variatie cumulata, prag", prag_variatie, "%:", nr_cumulat,
    "componente; cumul =", round(acp$eig[nr_cumulat, 3], 3), "%.\n")
# Decizia foloseste valorile nerotunjite. Cele doua criterii pot diferi!
# Pentru prag: alegi primul rand care atinge/depaseste procentul impus.

# 3. MATRICEA FACTOR: INTERPRETAREA PC2 (2p) --------------------------------
cat("\n3. Matricea factor = corelatii indicatori-componente\n")
MF <- cor(X, acp$ind$coord)
print(round(MF, 3))
cat("PC2 explica", round(acp$eig[2, 2], 3), "% din variatia totala.\n")
# Foloseste coloana Dim.2: alege corelatiile cele mai mari in modul.
# Scor mare pe PC2 -> tendinta de valori mari pentru indicatorii cu semn +
# si mici pentru cei cu semn -. Da o denumire care rezuma acest profil.

# 4. OUTPUTUL VARIABILELOR: Dim1, Dim2 SI ctr (2p) --------------------------
cat("\n4. Corelatii si contributii ale tuturor indicatorilor\n")
tabel_var <- cbind(
  Dim1 = acp$var$coord[, 1],
  Dim2 = acp$var$coord[, 2],
  `ctr1 (%)` = acp$var$contrib[, 1],
  `ctr2 (%)` = acp$var$contrib[, 2]
)
print(round(tabel_var, 3))
cat("Contributie medie de referinta (100 / numarul indicatorilor):",
    round(100 / ncol(X), 3), "% pe componenta.\n")
# Dim1/Dim2 = corelatia indicatorului cu PC1/PC2 (intre -1 si +1).
# ctr1/ctr2 = cat contribuie indicatorul la construirea componentei (%).
# Suma contributiilor TUTUROR indicatorilor pe fiecare componenta = 100%.

# 5. GRAFICUL REGIUNILOR SI DOUA CONCLUZII (2p) -----------------------------
grafic_regiuni <- fviz_pca_ind(
  acp, axes = c(1, 2), repel = TRUE, col.ind = "cos2",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  title = "Reprezentarea regiunilor in planul PC1 - PC2"
) + ggplot2::labs(
  x = sprintf("Componenta 1 (%.2f%%)", acp$eig[1, 2]),
  y = sprintf("Componenta 2 (%.2f%%)", acp$eig[2, 2])
)
print(grafic_regiuni)  # afisare inclusiv cand folosesti Source

director_grafice <- file.path("rezultate", "grafice")
dir.create(director_grafice, recursive = TRUE, showWarnings = FALSE)
ggplot2::ggsave(file.path(director_grafice, "test_ACP_regiuni_PC1_PC2.png"),
                plot = grafic_regiuni, width = 12, height = 9, dpi = 300)
cat("\nGrafic salvat in:", normalizePath(director_grafice), "\n")

tabel_ind <- data.frame(
  Scor_PC1 = acp$ind$coord[, 1],
  Scor_PC2 = acp$ind$coord[, 2],
  cos2_plan = rowSums(acp$ind$cos2[, 1:2, drop = FALSE])
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
# Concluzia 1: compara regiuni pe PC1 si explica profilul folosind MF[, 1].
# Concluzia 2: compara regiuni pe PC2 si explica profilul folosind MF[, 2].
# Verifica cos2_plan inainte sa formulezi concluzii ferme despre o regiune.
# Pentru o regiune anume: tabel_ind["numele_regiunii", , drop = FALSE]
