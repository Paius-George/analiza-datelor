# SEMINARII 4-5: ANALIZA COMPONENTELOR PRINCIPALE
# Cerinte: Seminarii/Seminarii 4-5.pdf. Prioritate: Cursuri/cap1 - ACP.pdf.
# In RStudio: Session -> Set Working Directory -> To Source File Location.
# Script pregatit pentru executare manuala; nu a fost executat la actualizare.
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

print(dim(X))

# 2. Standardizarea si matricea de corelatie.
Z <- scale(X, center = TRUE, scale = TRUE)
apply(Z, 2, mean)
apply(Z, 2, sd)
R <- cor(X)
R
# Standardizam deoarece indicatorii au unitati si scari diferite.
# Coloanele lui Z au medii aproximativ 0 si abateri standard egale cu 1.
# Standardizarea nu implica normalitatea distributiilor.

# 3. Valorile si vectorii proprii.
E2 <- eigen(R)
Lambda2 <- E2$values
V <- E2$vectors
Lambda2
round(V, 3)
# R = V %*% diag(Lambda2) %*% t(V); vectorii proprii sunt ortonormati.
max(abs(R - V %*% diag(Lambda2) %*% t(V)))
round(crossprod(V), 7)
# Curs recapitulare, pag. 20: covarianta datelor standardizate = corelatia.
max(abs(cov(Z) - R))

# 4. ACP cu princomp, ca in PDF.
acp <- aliniaza_princomp(princomp(X, cor = TRUE, scores = TRUE))
summary(acp)

# 5. Legatura dintre abaterile standard si valorile proprii.
sqrt(Lambda2)
acp$sdev
acp$sdev^2

# 6. Loadings si comparatia cu vectorii proprii.
acp$loadings
round(E2$vectors, 3)
# Unele coloane pot avea semne opuse. Axa ramane aceeasi.
coef <- as.matrix(acp$loadings)
semne_eigen <- sign(colSums(V * coef))
V_aliniat <- sweep(V, 2, semne_eigen, "*")
max(abs(coef - V_aliniat))
# Loadings sunt coeficientii combinatiilor liniare, nu corelatiile
# dintre indicatori si componente (acestea formeaza matricea factor).

# 7. Scorurile si dimensiunea matricei.
scoruri <- acp$scores
dim(scoruri)
round(scoruri, 3)[1:5, ]

# 8. Calculul manual din PDF.
Ponderare2 <- Z %*% coef
round(Ponderare2, 3)[1:5, ]

# scale() foloseste n-1, iar princomp foloseste n pentru scoruri.
# Corectia de mai jos reproduce exact scorurile princomp.
Ponderare_corecta <- sqrt(n / (n - 1)) * Ponderare2
max(abs(scoruri - Ponderare_corecta))

# 9. Proprietatile componentelor principale.
sum(Lambda2)
# Conservarea variantei generalizate (curs ACP, pag. 7).
c(determinant_corelatie = det(R), produs_lambda = prod(Lambda2))
round(cor(scoruri), 7)
colMeans(scoruri)
# Variantele cu divizor n sunt valorile proprii; cov() foloseste n-1.
variante_componente <- diag(cov(scoruri)) * (n - 1) / n
cbind(lambda = Lambda2, varianta = variante_componente)
# Componente centrate, necorelate, cu variante descrescatoare.
# Necorelarea nu implica in general independenta.
# Cu toate componentele reconstruim exact datele standardizate cu n.
Z_n <- sqrt(n / (n - 1)) * Z
Z_reconstituit <- scoruri %*% t(coef)
max(abs(Z_n - Z_reconstituit))

# 10. Alegerea numarului de componente.
plot(acp, type = "lines", npcs = p)
abline(h = 1, col = "red", lty = 2)
Lambda2 > 1
cumsum(Lambda2) / sum(Lambda2) * 100
rezumat_acp <- data.frame(
  componenta = paste0("PC", seq_len(p)),
  lambda = Lambda2,
  procent = 100 * Lambda2 / sum(Lambda2),
  cumulat = 100 * cumsum(Lambda2) / sum(Lambda2)
)
print(rezumat_acp, digits = 5, row.names = FALSE)
k_kaiser <- sum(Lambda2 > 1)
k_80 <- which(rezumat_acp$cumulat >= 80)[1]
c(Kaiser = k_kaiser, prag_80_procente = k_80)
# Kaiser: 3 componente. Pentru minimum 80% pastram 4 componente.
# Primele 3 explica 79.47%, iar primele 4 explica 85.06%.
# Planul primelor doua axe explica 70.34% din variatia totala.
scoruri_retinute <- scoruri[, seq_len(k_80), drop = FALSE]
dim(scoruri_retinute) # 116 x 4

# 11. Matricea factor si reprezentarea regiunilor.
MF <- cor(X, scoruri)
round(MF, 3)
MF_manual <- sweep(coef, 2, acp$sdev, "*")
max(abs(MF - MF_manual))
round(MF[, seq_len(k_80), drop = FALSE], 3)
# PC1: participare digitala si integrare economica si sociala.
# X1-X6, X9 si X10 au corelatii pozitive; X7, X8 si X11, negative.
# PC2: profil mixt; somajul, densitatea si studiile superioare se opun
# ocuparii. Un scor pozitiv nu inseamna automat o situatie mai buna.
# PC3: diferentiaza mai ales densitatea, PIB si formarea adultilor.
# PC3 este orientata aici ca in Excel: densitatea si PIB au semn pozitiv.
# PC4: accesul la internet acasa se opune mai ales studiilor superioare.
# Semnul unei axe este arbitrar: coeficientii si scorurile se inverseaza
# impreuna, fara sa schimbe variatia explicata sau interpretarea opozitiilor.
# Denumirile axelor includ procentul de variatie explicata.
procent_axe <- 100 * acp$sdev^2 / sum(acp$sdev^2)
nume_PC1 <- sprintf("Participare digitala si integrare\neconomica si sociala (%.2f%%)",
                    procent_axe[1])
nume_PC2 <- sprintf("Profil mixt al pietei muncii,\neducatiei si teritoriului (%.2f%%)",
                    procent_axe[2])

# Biplot cu prima componenta pe orizontala.
parametri_biplot <- par(mfrow = c(1, 1), mar = c(6, 6, 4, 4))
biplot(acp, choices = c(1, 2),
       xlab = nume_PC1, ylab = nume_PC2,
       main = "Biplot - componentele principale 1 si 2",
       cex = c(0.5, 0.8), cex.lab = 0.85)

# Biplot vertical: prima componenta pe verticala, a doua pe orizontala.
biplot(acp, choices = c(2, 1),
       xlab = nume_PC2, ylab = nume_PC1,
       main = "Biplot vertical - prima componenta pe axa Y",
       cex = c(0.5, 0.8), cex.lab = 0.85)
par(parametri_biplot)
# Punctele sunt regiuni, sagetile reprezinta variabilele. Apropierea
# regiunilor se interpreteaza numai in proiectia pe axele afisate.

# 12. ACP cu FactoMineR, ca in tema din PDF.
cere_pachete(c("FactoMineR", "factoextra"))
library(FactoMineR)
library(factoextra)
acp2 <- PCA(X, scale.unit = TRUE, ncp = p, graph = FALSE)
acp2 <- aliniaza_PCA(acp2, acp)
summary(acp2)
print(fviz_eig(acp2))
print(fviz_pca_ind(acp2))
print(fviz_pca_var(acp2, col.var = "contrib"))
# Contributia arata aportul la construirea axei, iar cos2 arata calitatea
# reprezentarii. Sagetile apropiate indica asocieri pozitive, cele opuse
# asocieri negative, daca variabilele sunt bine reprezentate in plan.

# 13. Comparatia princomp si PCA.
# Valorile proprii trebuie sa coincida, in limita preciziei numerice.
cbind(princomp = acp$sdev^2, PCA = acp2$eig[, 1])

# Dupa alinierea semnelor, diagonala are +1: aceleasi axe.
round(cor(scoruri[, 1:4], acp2$ind$coord[, 1:4]), 3)

# Aliniem semnele pentru comparatia numerica a tuturor componentelor.
corelatii_metode <- cor(scoruri, acp2$ind$coord)
semne_PCA <- sign(diag(corelatii_metode))
scoruri_PCA_aliniate <- sweep(acp2$ind$coord, 2, semne_PCA, "*")
MF_PCA_aliniata <- sweep(acp2$var$coord, 2, semne_PCA, "*")
c(eroare_valori_proprii = max(abs(acp$sdev^2 - acp2$eig[, 1])),
  eroare_scoruri = max(abs(scoruri - scoruri_PCA_aliniate)),
  eroare_matrice_factor = max(abs(MF - MF_PCA_aliniata)))
# Cod de verificare pregatit, neexecutat la actualizare.
# Erorile trebuie sa fie aproape de zero (de exemplu, sub 1e-8).
# ncp=p pastreaza toate coordonatele pentru comparatie; pentru interpretare
# retinem cele 4 componente justificate prin pragul de 80%.

# 14. Interpretarea regiunilor din Romania.
regiuni_RO <- grepl("^RO", rownames(X))
scoruri_RO <- scoruri_retinute[regiuni_RO, , drop = FALSE]
round(scoruri_RO[order(scoruri_RO[, 1], decreasing = TRUE), , drop = FALSE], 3)
# Cele 6 regiuni romanesti incluse au PC1 negativ fata de media esantionului.
# Nord-Vest are cel mai mare PC1 (-2.754), iar Sud-Est cel mai mic (-6.140).
# Bucuresti-Ilfov si Vest nu sunt incluse din cauza datelor indisponibile X8.
# Rezultatele descriu asocieri pentru regiunile cu date complete din 2024;
# nu demonstreaza cauzalitate si nu reprezinta un clasament oficial.

# Tabele complete, produse doar cand executi tu scriptul.
salveaza_tabel(rezumat_acp, "valori_proprii")
salveaza_tabel(coef, "loadings")
salveaza_tabel(MF, "matrice_factor")
salveaza_tabel(scoruri, "scoruri")
# Biploturi exportate in format PDF, inclusiv versiunea cu PC1 vertical.
pdf(file.path(director_rezultate_R, "biploturi.pdf"), width = 10, height = 8)
par(mar = c(6, 6, 4, 4))
biplot(acp, choices = c(1, 2), xlab = nume_PC1, ylab = nume_PC2,
       cex = c(.5, .8), cex.lab = .85)
biplot(acp, choices = c(2, 1), xlab = nume_PC2, ylab = nume_PC1,
       cex = c(.5, .8), cex.lab = .85)
dev.off()
