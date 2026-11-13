# INSTALARE FINAL ACP: deschide in RStudio si apasa Source o singura data.
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

# Instaleaza si addin-ul local, fara sa ruleze analiza.
cale_instalator <- ""
if (rstudioapi::isAvailable()) {
  cale_instalator <- tryCatch(rstudioapi::getSourceEditorContext()$path,
                              error = function(e) "")
}
for (cadru in sys.frames()) {
  if (!is.null(cadru$ofile)) cale_instalator <- cadru$ofile
}
candidati_addin <- unique(c(
  if (nzchar(cale_instalator)) file.path(dirname(cale_instalator), "acpnotes"),
  file.path(getwd(), "acpnotes")
))
candidati_addin <- candidati_addin[file.exists(file.path(candidati_addin, "DESCRIPTION"))]
if (!length(candidati_addin)) stop("Dezarhiveaza tot pachetul, inclusiv folderul acpnotes.")
if ("acpnotes" %in% loadedNamespaces()) {
  stop("Repornește sesiunea R, apoi ruleaza din nou instalatorul pentru actualizare.")
}
biblioteci_scriere <- .libPaths()[file.access(.libPaths(), 2) == 0]
if (!length(biblioteci_scriere)) stop("Nu exista o biblioteca R cu drept de scriere.")
install.packages(normalizePath(candidati_addin[1]), repos = NULL, type = "source",
                 lib = biblioteci_scriere[1])
if (!requireNamespace("acpnotes", quietly = TRUE)) stop("Instalarea addin-ului nu a reusit.")
cat("\nInstalare terminata. In RStudio: Tools > Modify Keyboard Shortcuts.\n")
cat("Cauta Interpretari ACP si alege o singura combinatie libera, de exemplu Ctrl+Shift+F12.\n")
cat("Aceeasi combinatie deschide si inchide rezumatul; analiza nu trebuie pornita.\n")
