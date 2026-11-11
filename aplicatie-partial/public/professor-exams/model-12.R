# Model 12: date sintetice de antrenament; rulează manual dacă dorești.
# Salvează CSV-ul lângă script și setează acel folder ca director de lucru.
# Pachete necesare: corrplot, factoextra, FactoMineR. Instalare manuală, o singură dată:
# install.packages(c("corrplot", "factoextra", "FactoMineR"))
X <- read.csv("model-12.csv", row.names=1, check.names=FALSE)
stopifnot(all(vapply(X, is.numeric, logical(1))), !anyNA(X))
# Comenzile profesorului, transcrise fără schimbarea algoritmilor:
#import date
cor(scale(X,center=T,scale=T))
acp <- princomp(X,cor=T,scores=TRUE)
summary(acp)
plot(acp,type="l")
scoruri <- acp$scores
MF=cor(X,scoruri)
library(corrplot)
corrplot(MF,method="number")
library(factoextra)
library(FactoMineR)
acp2 <- PCA(X,scale.unit=T,graph=T)
acp2
summary(acp2)
fviz_pca_ind(acp2)

# Opțional, ca să vezi toate variabilele pentru primele două axe:
# summary(acp2, nbelements=ncol(X), ncp=2)
# Semnele axelor pot diferi între princomp și PCA. Nu compara sensurile fără verificare.
