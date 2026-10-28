# SEMINARII 4-5: ANALIZA COMPONENTELOR PRINCIPALE
# In RStudio: Session -> Set Working Directory -> To Source File Location.
# Selecteaza comenzile si ruleaza-le cu Ctrl+Enter (Cmd+Enter pe Mac).

# Pachetele se instaleaza o singura data, daca lipsesc:
# install.packages("FactoMineR")
# install.packages("factoextra")
library(FactoMineR)
library(factoextra)

# 1. Importul datelor. Scriptul poate fi rulat independent de primul.
X <- read.table("digitalizare.txt", header = TRUE, row.names = 1, sep = "\t")
dim(X)

# 2. Standardizarea si matricea de corelatie.
Z <- scale(X, center = TRUE, scale = TRUE)
apply(Z, 2, mean)
apply(Z, 2, sd)
R <- cor(X)
R

# 3. Valorile si vectorii proprii.
E2 <- eigen(R)
Lambda2 <- E2$values
V <- E2$vectors
Lambda2
round(V, 3)

# 4. ACP cu princomp, ca in PDF.
acp <- princomp(X, cor = TRUE, scores = TRUE)
summary(acp)

# 5. Legatura dintre abaterile standard si valorile proprii.
sqrt(Lambda2)
acp$sdev
acp$sdev^2

# 6. Loadings si comparatia cu vectorii proprii.
acp$loadings
round(E2$vectors, 3)
# Unele coloane pot avea semne opuse. Axa ramane aceeasi.

# 7. Scorurile si dimensiunea matricei.
scoruri <- acp$scores
dim(scoruri)
round(scoruri, 3)[1:5, ]

# 8. Calculul manual din PDF.
coef <- acp$loadings
Ponderare2 <- scale(X, center = TRUE, scale = TRUE) %*% coef
round(Ponderare2, 3)[1:5, ]

# scale() foloseste n-1, iar princomp foloseste n pentru scoruri.
# Corectia de mai jos reproduce exact scorurile princomp.
n <- nrow(X)
Ponderare_corecta <- sqrt(n / (n - 1)) * Ponderare2
max(abs(scoruri - Ponderare_corecta))

# 9. Proprietatile componentelor principale.
sum(Lambda2)
round(cor(scoruri), 7)

# 10. Alegerea numarului de componente.
plot(acp, type = "lines", npcs = 12)
Lambda2 > 1
cumsum(Lambda2) / sum(Lambda2) * 100
# Kaiser: 3 componente. Pentru minimum 80% pastram 4 componente.

# 11. Matricea factor si reprezentarea regiunilor.
MF <- cor(X, scoruri)
round(MF, 3)
biplot(acp)

# 12. ACP cu FactoMineR, ca in tema din PDF.
acp2 <- PCA(X, scale.unit = TRUE, ncp = 12, graph = FALSE)
summary(acp2)
fviz_eig(acp2)
fviz_pca_ind(acp2)
fviz_pca_var(acp2, col.var = "contrib")

# 13. Comparatia princomp si PCA.
# Valorile proprii trebuie sa coincida, in limita preciziei numerice.
cbind(princomp = acp$sdev^2, PCA = acp2$eig[, 1])

# Pe diagonala apar valori +1 sau -1: aceleasi axe, eventual semne opuse.
round(cor(scoruri[, 1:4], acp2$ind$coord[, 1:4]), 3)
