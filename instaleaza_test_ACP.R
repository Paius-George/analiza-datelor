# INSTALARE TEST ACP: deschide in RStudio si apasa Source o singura data.
# Necesita internet. Instaleaza pachetele; nu executa analiza.
# Se foloseste o singura data pe calculator sau dupa schimbarea versiunii R.
pachete <- c("readxl", "ggplot2", "FactoMineR", "factoextra", "rstudioapi", "corrplot")
lipsa <- pachete[!vapply(pachete, requireNamespace, logical(1), quietly = TRUE)]

if (length(lipsa)) {
  biblioteca <- strsplit(Sys.getenv("R_LIBS_USER"), .Platform$path.sep,
                        fixed = TRUE)[[1]][1]
  if (is.na(biblioteca) || !nzchar(biblioteca)) {
    stop("R_LIBS_USER nu este configurat pentru biblioteca personala.")
  }
  biblioteca <- path.expand(biblioteca)
  dir.create(biblioteca, recursive = TRUE, showWarnings = FALSE)
  .libPaths(c(biblioteca, .libPaths()))
  # Pe Linux, fs poate compila versiunea libuv inclusa daca lipseste libuv-devel.
  instaleaza <- function() {
    anterior <- Sys.getenv("USE_BUNDLED_LIBUV", unset = NA_character_)
    on.exit({
      if (is.na(anterior)) Sys.unsetenv("USE_BUNDLED_LIBUV")
      else Sys.setenv(USE_BUNDLED_LIBUV = anterior)
    })
    Sys.setenv(USE_BUNDLED_LIBUV = "1")
    install.packages(lipsa, lib = biblioteca, repos = "https://cloud.r-project.org")
  }
  instaleaza()
}

disponibil <- vapply(pachete, requireNamespace, logical(1), quietly = TRUE)
print(data.frame(pachet = pachete, disponibil = disponibil, row.names = NULL))
if (!all(disponibil)) {
  stop("Unele pachete nu s-au instalat. Verifica mesajele de instalare de mai sus.")
}

cat("\nInstalare terminata. Deschide cod_test_ACP.R si foloseste Source.\n")
