# SEMINARII 1-3: STATISTICI DESCRIPTIVE SI GRAFICE
# In RStudio: Session -> Set Working Directory -> To Source File Location.
# Selecteaza comenzile si ruleaza-le cu Ctrl+Enter (Cmd+Enter pe Mac).

# Pachetele se instaleaza o singura data, daca lipsesc:
# install.packages("corrplot")
# install.packages("ggplot2")
library(corrplot)
library(ggplot2)

# 1. Importul datelor. Prima coloana contine codurile regiunilor.
X <- read.table("digitalizare.txt", header = TRUE, row.names = 1, sep = "\t")
dim(X)
head(X)

# 2. Statistici descriptive, ca in PDF.
medii <- apply(X, 2, mean)
medii

abateri <- apply(X, 2, sd)
abateri

q <- apply(X, 2, quantile)
q

# 3. Boxplot: distributii si observatii extreme.
boxplot(X)
boxplot(scale(X))

# Valorile extreme pentru fiecare indicator, dupa regula boxplot.
for (i in 1:12) {
  print(names(X)[i])
  print(boxplot.stats(X[, i])$out)
}

# 4. Histogramele celor 12 indicatori.
par(mfrow = c(3, 4))
for (i in 1:12) {
  hist(X[, i], main = names(X)[i], xlab = "Valoare", col = "lightblue")
}
par(mfrow = c(1, 1))

# 5. Reprezentarea observatiilor.
plot(X)
plot(X$X2, X$X5, xlab = "Internet zilnic (%)", ylab = "PIB/locuitor (PPS)")

# 6. Matricea corelatiilor.
R <- cor(X)
R
corrplot(R)

# 7. Grafic simultan cu trei variabile.
# X2 = internet zilnic, X5 = PIB, X6 = ocupare.
ggplot(X, aes(x = X2, y = X5, color = X6)) +
  geom_point() +
  labs(x = "Internet zilnic (%)", y = "PIB/locuitor (PPS)", color = "Ocupare (%)")

# 8. Grafic simultan cu patru variabile.
# Adaugam X9 = ponderea populatiei cu studii superioare.
ggplot(X, aes(x = X2, y = X5, color = X6, size = X9)) +
  geom_point() +
  scale_size_area(max_size = 9) +
  labs(x = "Internet zilnic (%)", y = "PIB/locuitor (PPS)",
       color = "Ocupare (%)", size = "Studii superioare (%)")
