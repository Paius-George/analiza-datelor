# Stare privata, independenta de obiectele analizei din Global Environment.
.stare <- new.env(parent = emptyenv())
.stare$id <- NULL
.stare$cale <- NULL
.stare$revenire <- NULL

# Deschide/inchide exclusiv documentul de notite creat de acest addin.
toggle_interpretari <- function() {
  if (!rstudioapi::isAvailable() || rstudioapi::getVersion() < "1.4.1106") {
    stop("Addin-ul necesita RStudio 1.4.1106 sau mai nou.")
  }
  if (!is.null(.stare$id)) {
    cale_deschisa <- tryCatch(rstudioapi::documentPath(.stare$id),
                              error = function(e) "")
    if (length(cale_deschisa) == 1 && nzchar(cale_deschisa) &&
        identical(normalizePath(cale_deschisa, winslash = "/", mustWork = FALSE),
                  .stare$cale)) {
      # Salveaza eventualele adnotari personale in copia temporara.
      rstudioapi::documentClose(id = .stare$id, save = TRUE)
      .stare$id <- NULL
      if (!is.null(.stare$revenire) && file.exists(.stare$revenire)) {
        rstudioapi::documentOpen(.stare$revenire)
      }
      return(invisible(NULL))
    }
    # Fila a fost inchisa manual: urmatoarea apasare o redeschide.
    .stare$id <- NULL
  }
  curent <- rstudioapi::getSourceEditorContext()
  .stare$revenire <- if (nzchar(curent$path)) curent$path else NULL
  if (is.null(.stare$cale) || !file.exists(.stare$cale)) {
    original <- system.file("notes", "interpretari.txt", package = "acpnotes")
    copie <- tempfile(pattern = "Interpretari_ACP_", fileext = ".txt")
    if (!nzchar(original) || !file.copy(original, copie)) {
      stop("Rezumatul lipseste. Reinstaleaza addin-ul cu instaleaza_test_ACP.R.")
    }
    .stare$cale <- normalizePath(copie, winslash = "/", mustWork = TRUE)
  }
  rstudioapi::documentOpen(.stare$cale)
  .stare$id <- rstudioapi::documentId(allowConsole = FALSE)
  invisible(NULL)
}
