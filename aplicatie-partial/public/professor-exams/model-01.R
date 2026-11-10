# Date de exercițiu; rulează tu, dacă dorești. Nu necesită pachete externe.
# Salvează CSV-ul și acest script în același folder; setează acel folder în R.
d <- read.csv("model-01.csv", row.names = 1, check.names = FALSE)
R <- cor(d)
e <- eigen(R, symmetric = TRUE)
V <- e$vectors
anchors <- c(4,7,12,1,5,10,4,2,9,4,7,3)
for (j in seq_len(ncol(V))) if (V[anchors[j], j] < 0) V[,j] <- -V[,j]
factor <- sweep(V, 2, sqrt(e$values), "*")
rownames(factor) <- colnames(d)
colnames(factor) <- paste0("Dim", seq_len(ncol(d)))
scoruri <- scale(d) %*% V
rownames(scoruri) <- rownames(d)
print(round(R, 3))
print(round(cbind(lambda=e$values, procent=100*e$values/ncol(d), cumulat=cumsum(100*e$values/ncol(d))), 3))
print(round(factor[,1:2], 3))
print(round(cbind(Dim1=factor[,1], Dim2=factor[,2], ctr1=100*V[,1]^2, ctr2=100*V[,2]^2), 3))
plot(scoruri[,1:2], type="n", xlab="Componenta 1", ylab="Componenta 2", main="Regiuni în planul ACP")
text(scoruri[,1:2], labels=rownames(d), cex=.6)
abline(h=0,v=0,col="grey")
# Scorurile folosesc standardizarea cu abaterea standard de eșantion.
# Față de alte funcții PCA, semnul axelor sau scara scorurilor pot diferi.
