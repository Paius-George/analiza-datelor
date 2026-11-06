# Import unic din centralizare.xlsx. Se apeleaza din scripturile seminariilor.
# Pe un calculator nou, executa separat instaleaza_pachete.R inaintea seminariilor.
# Instalare manuala, o singura data, daca este necesar:
# install.packages(c("readxl", "corrplot", "ggplot2", "FactoMineR", "factoextra"),
#                  repos = "https://cloud.r-project.org")
cere_pachete <- function(pachete) {
  lipsa <- pachete[!vapply(pachete, requireNamespace, logical(1), quietly = TRUE)]
  if (length(lipsa)) {
    stop(paste0("Lipsesc pachetele: ", paste(lipsa, collapse = ", "),
                ". Executa separat instaleaza_pachete.R din folderul proiectului."),
         call. = FALSE)
  }
}
cere_pachete("readxl")
date_complete <- as.data.frame(readxl::read_excel(
  file.path(director_proiect, "centralizare.xlsx"), sheet = "Date complete"))
coduri <- paste0("X", 1:12)
stopifnot(all(c("geo", "regiune", "an", coduri) %in% names(date_complete)),
          !anyDuplicated(date_complete$geo), all(date_complete$an == 2024))
X <- date_complete[, coduri, drop = FALSE]
rownames(X) <- date_complete$geo
stopifnot(all(vapply(X, is.numeric, logical(1))),
          all(is.finite(as.matrix(X))), nrow(X) > ncol(X),
          all(vapply(X, sd, numeric(1)) > 0))
n <- nrow(X)
p <- ncol(X)
# TXT-ul existent trebuie sa fie acelasi set, inclusiv ordinea codurilor.
X_txt <- read.table(file.path(director_proiect, "digitalizare.txt"),
                    header = TRUE, row.names = 1, sep = "\t")
stopifnot(identical(rownames(X), rownames(X_txt)), identical(names(X), names(X_txt)),
          max(abs(as.matrix(X) - as.matrix(X_txt))) < 1e-8)
director_rezultate_R <- file.path(director_proiect, "rezultate_R")
dir.create(director_rezultate_R, showWarnings = FALSE)
salveaza_tabel <- function(obiect, nume) {
  write.csv(obiect, file.path(director_rezultate_R, paste0(nume, ".csv")),
            row.names = TRUE, fileEncoding = "UTF-8")
}
# Numele se deduc din matricea factor, conform cursului cap1, pag. 9.
nume_componente <- c(
  "Participare digitala si integrare economica si sociala",
  "Profil mixt al pietei muncii, educatiei si teritoriului",
  "Concentrare urbana si economica versus formare continua",
  "Acces la internet versus studii superioare"
)
# Fixam semnele primelor patru axe la aceeasi orientare ca in Excel:
# PC1: X4 pozitiv; PC2: X7 pozitiv; PC3: X12 pozitiv; PC4: X1 pozitiv.
# Inversarea simultana a coeficientilor si scorurilor nu schimba solutia.
semne_orientare <- function(matrice_factor) {
  semne <- rep(1, ncol(matrice_factor))
  ancore <- c("X4", "X7", "X12", "X1")
  for (j in seq_along(ancore)) {
    semne[j] <- if (matrice_factor[ancore[j], j] < 0) -1 else 1
  }
  semne
}
aliniaza_princomp <- function(model) {
  semne <- semne_orientare(cor(X, model$scores))
  model$loadings[,] <- sweep(as.matrix(model$loadings), 2, semne, "*")
  model$scores <- sweep(model$scores, 2, semne, "*")
  model
}
aliniaza_PCA <- function(model, referinta) {
  semne <- sign(diag(cor(referinta$scores, model$ind$coord)))
  model$ind$coord <- sweep(model$ind$coord, 2, semne, "*")
  model$var$coord <- sweep(model$var$coord, 2, semne, "*")
  if (!is.null(model$var$cor)) model$var$cor <- sweep(model$var$cor, 2, semne, "*")
  # PCA pastreaza si factorii SVD; ii aliniem pentru consistenta obiectului.
  if (!is.null(model$svd$U)) model$svd$U <- sweep(model$svd$U, 2, semne, "*")
  if (!is.null(model$svd$V)) model$svd$V <- sweep(model$svd$V, 2, semne, "*")
  model
}
