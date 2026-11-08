# SEMINARII 5-6: OUTPUTURI ACP, CALITATE, CONTRIBUTII SI PRIMELE 4 AXE
# Cerinte: Seminarii/Seminarii 5-6.pdf, pag. 1-4.
# Formule: curs cap1 - ACP, pag. 9 si 16; seminar 5-6, pag. 2.
directoare <- c(getwd(), vapply(sys.frames(), function(cadru) {
  if (is.null(cadru$ofile)) "" else dirname(cadru$ofile)
}, character(1)))
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
  directoare <- c(directoare, dirname(rstudioapi::getSourceEditorContext()$path))
}
directoare <- unique(directoare[nzchar(directoare)])
candidat <- directoare[file.exists(file.path(directoare, "pregatire_date.R"))]
if (!length(candidat)) stop("Deschide scriptul din folderul proiectului si seteaza working directory la acel folder.")
director_proiect <- normalizePath(candidat[1], winslash = "/")
source(file.path(director_proiect, "pregatire_date.R"), encoding = "UTF-8")

cere_pachete(c("FactoMineR", "factoextra", "ggplot2"))
library(FactoMineR)
library(factoextra)
library(ggplot2)

# 1. Ambele metode, pe acelasi set si aceeasi standardizare.
acp <- aliniaza_princomp(princomp(X, cor = TRUE, scores = TRUE))
acp2 <- PCA(X, scale.unit = TRUE, ncp = p, graph = FALSE)
acp2 <- aliniaza_PCA(acp2, acp)
summary(acp)
summary(acp2, nbelements = n)
valori_proprii <- acp2$eig
print(valori_proprii)

# 2. Rezultate pentru variabile: coordonate = matricea factor.
coord_var <- acp2$var$coord
cos2_var <- acp2$var$cos2
contrib_var <- acp2$var$contrib
print(round(coord_var[, 1:4], 3))
print(round(cos2_var[, 1:4], 3))
print(round(contrib_var[, 1:4], 3))
# cos2_jk = cor(X_j, PC_k)^2; contributia in procente = 100*cos2_jk/lambda_k.
# Sumele cos2 pe coloane = lambda; sumele contributiilor pe coloane = 100.
# Suma cos2 pe TOATE cele 12 axe = 1 pentru fiecare variabila.
MF_manual <- cor(X, acp$scores)
cos2_var_manual <- MF_manual^2
contrib_var_manual <- 100 * sweep(cos2_var_manual, 2, acp$sdev^2, "/")
calitate_var <- data.frame(plan12 = rowSums(cos2_var[, 1:2]),
                           plan34 = rowSums(cos2_var[, 3:4]),
                           primele4 = rowSums(cos2_var[, 1:4]))
print(round(calitate_var, 3))
# Referinta contributie variabile: 100/p = 8.33% pe fiecare axa.

# 3. Rezultate pentru regiuni.
coord_ind <- acp2$ind$coord
cos2_ind <- acp2$ind$cos2
contrib_ind <- acp2$ind$contrib
Z_n <- sqrt(n / (n - 1)) * scale(X)
distanta2 <- rowSums(Z_n^2)
# Dist din summary(PCA) este distanta, NU patratul distantei.
distanta <- sqrt(distanta2)
cos2_ind_manual <- sweep(acp$scores^2, 1, distanta2, "/")
contrib_ind_manual <- 100 * sweep(acp$scores^2, 2, n * acp$sdev^2, "/")
regiuni <- data.frame(geo = rownames(X), regiune = date_complete$regiune,
  distanta = distanta, distanta2 = distanta2, masa = 1 / n,
  inertie = distanta2 / n,
  PC1 = coord_ind[, 1], PC2 = coord_ind[, 2],
  PC3 = coord_ind[, 3], PC4 = coord_ind[, 4],
  cos2_plan12 = rowSums(cos2_ind[, 1:2]),
  cos2_plan34 = rowSums(cos2_ind[, 3:4]),
  cos2_primele4 = rowSums(cos2_ind[, 1:4]))
print(head(regiuni, 10))
print(regiuni[grepl("^RO", regiuni$geo), ])
# Referinta contributie regiuni: 100/n = 0.862% pe axa.
# Un punct departe de origine poate contribui mult, dar trebuie verificat cos2.

# 4. Verificari numerice princomp versus PCA si formulele din curs.
erori <- c(
  lambda = max(abs(acp$sdev^2 - valori_proprii[, 1])),
  scoruri = max(abs(acp$scores - coord_ind)),
  matrice_factor = max(abs(MF_manual - coord_var)),
  cos2_variabile = max(abs(cos2_var_manual - cos2_var)),
  contributii_variabile = max(abs(contrib_var_manual - contrib_var)),
  cos2_regiuni = max(abs(cos2_ind_manual - cos2_ind)),
  contributii_regiuni = max(abs(contrib_ind_manual - contrib_ind)),
  suma_cos2_var = max(abs(colSums(cos2_var) - valori_proprii[, 1])),
  suma_contrib_var = max(abs(colSums(contrib_var) - 100)),
  suma_contrib_ind = max(abs(colSums(contrib_ind) - 100)),
  cos2_total_var = max(abs(rowSums(cos2_var) - 1)),
  cos2_total_ind = max(abs(rowSums(cos2_ind) - 1)))
print(erori)
stopifnot(all(erori < 1e-8))

# 5. Graficele din seminar.
print(fviz_eig(acp2, addlabels = TRUE))
print(fviz_pca_var(acp2, col.var = "contrib", repel = TRUE))
print(fviz_pca_ind(acp2, col.ind = "cos2", repel = TRUE))
print(fviz_pca_var(acp2, axes = c(3, 4), col.var = "cos2", repel = TRUE))
print(fviz_pca_ind(acp2, axes = c(3, 4), col.ind = "cos2", repel = TRUE))

# 6. TEMA: primele PATRU componente intr-un grafic ggplot.
# Pozitie X=PC1, Y=PC2, culoare=PC3, marime crescatoare=PC4.
# PC4 poate fi negativ; scala grafica il mapeaza la dimensiuni pozitive.
# Un punct mai mare inseamna un scor PC4 mai mare, nu populatie mai mare.
procent <- valori_proprii[, 2]
grafic_4CP <- ggplot(regiuni, aes(x = PC1, y = PC2, color = PC3, size = PC4)) +
  geom_hline(yintercept = 0, color = "grey80") +
  geom_vline(xintercept = 0, color = "grey80") +
  geom_point(alpha = .8) +
  geom_text(data = subset(regiuni, grepl("^RO", geo)),
            aes(label = geo), size = 3, vjust = -1, color = "black", show.legend = FALSE) +
  scale_color_gradient2(low = "#2166AC", mid = "#EEEEEE", high = "#B2182B", midpoint = 0) +
  scale_size(range = c(2, 8)) + theme_minimal() +
  labs(title = "Regiunile descrise prin primele patru componente",
       subtitle = sprintf("Variatie explicata cumulat: %.2f%%", sum(procent[1:4])),
       x = sprintf("Participare digitala si integrare (%.2f%%)", procent[1]),
       y = sprintf("Profil mixt munca-educatie-teritoriu (%.2f%%)", procent[2]),
       color = "PC3: concentrare urbana
versus formare continua",
       size = "PC4: acces internet
versus studii superioare")
print(grafic_4CP)
ggsave(file.path(director_rezultate_R, "regiuni_primele_4_componente.png"),
       grafic_4CP, width = 12, height = 8, dpi = 180)
# Planul PC3-PC4 completeaza imaginea celor 14.72% absente din PC1-PC2.
grafic_34 <- ggplot(regiuni, aes(PC3, PC4)) + geom_point(color = "#2166AC") +
  geom_text(data = subset(regiuni, grepl("^RO", geo)), aes(label = geo),
            size = 3, vjust = -1) + theme_minimal() +
  labs(x = sprintf("Concentrare urbana versus formare (%.2f%%)", procent[3]),
       y = sprintf("Acces internet versus studii superioare (%.2f%%)", procent[4]))
print(grafic_34)
ggsave(file.path(director_rezultate_R, "regiuni_plan34.png"), grafic_34, width = 10, height = 7)

# 7. Export integral pentru toate cele 12 axe, nu doar cele din summary().
for (nume in c("valori_proprii", "coord_var", "cos2_var", "contrib_var", "calitate_var",
                "coord_ind", "cos2_ind", "contrib_ind", "regiuni")) {
  salveaza_tabel(get(nume), nume)
}
salveaza_tabel(data.frame(eroare_maxima = erori), "verificari_princomp_PCA")
