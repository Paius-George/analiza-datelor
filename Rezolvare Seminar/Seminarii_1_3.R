# SEMINARII 1-2 SI TEMA PENTRU SEMINARUL 3
# Cerinte: Seminarii/Seminarii 1-2.pdf, pag. 5-7.
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

# 1. Obiectiv: asocierea dintre digitalizare si dezvoltarea regionala.
# Date de profil: 116 regiuni NUTS2, 12 indicatori, anul 2024.
print(dim(X))
print(head(X))

# 2. Statistici descriptive (curs recapitulare, pag. 16-20).
statistici <- data.frame(
  medie = apply(X, 2, mean), sd = apply(X, 2, sd),
  t(apply(X, 2, quantile, probs = c(0, .25, .5, .75, 1), type = 7)),
  check.names = FALSE)
print(round(statistici, 3))
salveaza_tabel(statistici, "statistici")

# 3. Outlieri: balamalele Tukey din boxplot.stats(), nu cuantilele type=7.
# Pastram extremele deoarece nu exista dovezi ca ar fi erori de inregistrare.
salveaza_grafic_baza("boxplot_original", {
  boxplot(X, las = 2, main = "Indicatorii in unitatile originale")
})
salveaza_grafic_baza("boxplot_standardizat", {
  boxplot(scale(X), las = 2, main = "Indicatorii standardizati")
})
lista_outlieri <- lapply(names(X), function(cod) {
  b <- boxplot.stats(X[[cod]])
  selectate <- X[[cod]] %in% b$out
  data.frame(geo = rownames(X)[selectate],
             variabila = rep(cod, sum(selectate)), valoare = X[[cod]][selectate])
})
outlieri <- do.call(rbind, lista_outlieri)
print(outlieri)
print(table(factor(outlieri$variabila, levels = names(X))))
salveaza_tabel(outlieri, "outlieri")

# 4. Distributii si observatii.
salveaza_grafic_baza("histograme", {
  parametri_hist <- par(mfrow = c(3, 4), mar = c(3, 3, 2, 1), oma = c(0, 0, 3, 0))
  for (cod in names(X)) {
    hist(X[[cod]], main = paste("Distributia", cod), xlab = "Valoare", col = "lightblue")
  }
  mtext("Distributiile celor 12 indicatori regionali", outer = TRUE, font = 2)
  par(parametri_hist)
})
salveaza_grafic_baza("observatii_perechi", {
  plot(X, cex = 0.4, main = "Relatiile dintre indicatorii regionali")
}, latime = 16, inaltime = 16)
salveaza_grafic_baza("internet_PIB", {
  plot(X$X2, X$X5, xlab = "Internet zilnic (%)", ylab = "PIB/locuitor (PPS)",
       main = "Utilizarea zilnica a internetului si PIB pe locuitor")
})
# PIB si densitatea au asimetrie pozitiva; nu impunem normalitatea datelor.

# 5. Matricea corelatiilor. Asocierea nu demonstreaza cauzalitate.
R <- cor(X)
print(round(R, 3))
salveaza_tabel(R, "corelatii_Pearson")
print(c(Pearson = cor(X$X2, X$X5), Spearman = cor(X$X2, X$X5, method = "spearman")))
cere_pachete(c("corrplot", "ggplot2"))
salveaza_grafic_baza("corelatii_Pearson", {
  corrplot::corrplot(R, method = "color", type = "upper", addCoef.col = "black",
                    number.cex = 0.6, tl.col = "black", mar = c(0, 0, 3, 0),
                    title = "Corelatiile Pearson dintre indicatori")
}, latime = 10, inaltime = 10)
library(ggplot2)

# 6. Tema seminar 3: trei, apoi patru variabile simultan.
grafic_3 <- ggplot(X, aes(x = X2, y = X5, color = X6)) +
  geom_point(size = 2.5) + theme_minimal() +
  labs(title = "Internet zilnic, PIB si ocupare",
       x = "Internet zilnic (%)", y = "PIB/locuitor (PPS)", color = "Ocupare (%)")
salveaza_ggplot(grafic_3, "trei_variabile")
grafic_4 <- ggplot(X, aes(x = X2, y = X5, color = X6, size = X9)) +
  geom_point(alpha = .8) + scale_size_area(max_size = 9) + theme_minimal() +
  labs(title = "Internet zilnic, PIB, ocupare si studii superioare",
       x = "Internet zilnic (%)", y = "PIB/locuitor (PPS)",
       color = "Ocupare (%)", size = "Studii superioare (%)")
salveaza_ggplot(grafic_4, "patru_variabile")
