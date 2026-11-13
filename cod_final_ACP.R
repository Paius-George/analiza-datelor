# COD ACP - cele 5 cerinte din fotografia modelului de test
# Deschide in RStudio si foloseste Source. Datele proiectului sunt gasite automat.
# Prima linie din Excel trebuie sa contina numele coloanelor.
# Daca lipsesc pachetele, instaleaza-le o singura data din consola:
# Deschide instaleaza_final_ACP.R si foloseste Source o singura data.

pachete <- c("readxl", "FactoMineR", "factoextra", "corrplot", "ggplot2")
lipsa <- pachete[!vapply(pachete, requireNamespace, logical(1), quietly = TRUE)]
if (length(lipsa) > 0) {
  stop("Foloseste Source pe instaleaza_final_ACP.R. Lipsesc: ", paste(lipsa, collapse = ", "))
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
  # Compatibil si cu source(".../cod_final_ACP.R") in afara RStudio.
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
    stop("Pastreaza cod_final_ACP.R langa folderul Rezolvare Seminar cu centralizare.xlsx, sau completeaza fisier cu calea Excelului.")
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
# Compara si cu pragul alternativ cerut, de 70%.
nr_cumulat_70 <- which(acp2$eig[, 3] >= 70 - 1e-10)[1]
cat("Variatie cumulata, prag 70 %:", nr_cumulat_70,
    "componente; cumul =", round(acp2$eig[nr_cumulat_70, 3], 3), "%.\n")
# Procentele de 70% si 80% apartin variatiei cumulate, nu criteriului Kaiser.

# Salvare independenta de dimensiunea panoului Plots din RStudio.
director_grafice <- file.path("rezultate", "grafice")
if (!dir.exists(director_grafice) &&
    !dir.create(director_grafice, recursive = TRUE, showWarnings = FALSE)) {
  stop("Nu pot crea folderul de grafice. Alege un director de lucru cu drept de scriere.")
}
salveaza_si_afiseaza <- function(fisier_png, deseneaza, latime = 12,
                                inaltime = 9, afiseaza = interactive()) {
  # Fisierul este desenat primul, pe un dispozitiv propriu suficient de mare.
  # Nu inchidem si nu modificam dispozitivele grafice ale utilizatorului.
  local({
    png(fisier_png, width = latime, height = inaltime, units = "in", res = 180)
    dispozitiv <- dev.cur()
    on.exit(dev.off(dispozitiv), add = TRUE)
    deseneaza()
  })
  if (afiseaza) {
    tryCatch({
      # Un panou prea mic nu poate afisa lizibil matricea si etichetele.
      if (dev.cur() != 1L && any(dev.size("in") < c(7, 5))) {
        message("Panoul Plots este prea mic. Graficul complet este salvat in: ",
                normalizePath(fisier_png))
      } else {
        deseneaza()
      }
    }, error = function(e) {
      # Erorile de viewport/margini ale previzualizarii nu opresc analiza.
      message("Previzualizarea nu a putut fi afisata: ", conditionMessage(e),
              "\nGraficul complet este salvat in: ", normalizePath(fisier_png))
    })
  }
  invisible(fisier_png)
}
salveaza_si_afiseaza(
  file.path(director_grafice, "final_ACP_scree.png"),
  function() plot(acp, type = "l", main = "Scree plot - valori proprii")
)

# 3. MATRICEA FACTOR: INTERPRETAREA PC2 (2p) --------------------------------
scoruri <- acp$scores
MF <- cor(X, scoruri)
cat("\n3. Matricea factor (Comp.1, Comp.2, ...)\n")
print(round(MF, 3))
salveaza_si_afiseaza(
  file.path(director_grafice, "final_ACP_matrice_factor.png"),
  function() corrplot(MF, method = "number", tl.cex = 0.8, number.cex = 0.7)
)
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
salveaza_si_afiseaza(
  file.path(director_grafice, "final_ACP_regiuni_PC1_PC2.png"),
  function() print(grafic_regiuni)
)
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

# Rezumatul scurt este disponibil prin addin-ul Interpretari ACP.
# Asociaza-i o singura scurtatura in Tools > Modify Keyboard Shortcuts.
