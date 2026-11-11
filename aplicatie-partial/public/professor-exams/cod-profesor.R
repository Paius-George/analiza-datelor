# Transcriere din documentul furnizat: Cod test ACP.docx
# X trebuie să conțină doar indicatori numerici; codurile regiunilor sunt nume de rând.
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
