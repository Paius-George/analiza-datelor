# Rscript tests/verifica_final_ACP.R
# Verifica analiza reala, instalarea si regresiile dispozitivelor grafice.
argument <- grep("^--file=", commandArgs(), value = TRUE)
radacina <- dirname(dirname(normalizePath(sub("^--file=", "", argument[1]))))
verifica <- function() {
  lucru <- tempfile("verificare_final_ACP_")
  dir.create(lucru)
  vechi <- getwd()
  on.exit(setwd(vechi), add = TRUE)
  biblioteci <- .libPaths()
  on.exit(.libPaths(biblioteci), add = TRUE)
  biblioteca <- file.path(lucru, "biblioteca")
  dir.create(biblioteca)
  .libPaths(c(biblioteca, biblioteci))
  setwd(lucru)
  source(file.path(radacina, "instaleaza_final_ACP.R"), encoding = "UTF-8")
  stopifnot(requireNamespace("acpnotes", quietly = TRUE))

  # Reproduce mediul care bloca plot.new(), fara sa depinda de RStudio.
  png("panou_mic.png", width = 160, height = 120)
  panou <- dev.cur()
  on.exit(if (panou %in% dev.list()) dev.off(panou), add = TRUE)
  analiza <- new.env(parent = globalenv())
  source(file.path(radacina, "cod_final_ACP.R"), local = analiza, encoding = "UTF-8")
  stopifnot(dev.cur() == panou, ncol(analiza$X) == 12,
            analiza$nr_kaiser == 3, analiza$nr_cumulat == 4,
            analiza$nr_cumulat_70 == 2,
            abs(analiza$acp2$eig[2, 3] - 70.33882790) < 1e-6)
  imagini <- list.files("rezultate/grafice", pattern = "[.]png$", full.names = TRUE)
  stopifnot(length(imagini) == 3, all(file.info(imagini)$size > 10000))
  # Afisarea pe un panou mic este omisa, dar fisierul este generat.
  mesaje <- character()
  withCallingHandlers(
    analiza$salveaza_si_afiseaza("mic.png", function() plot(1:3), afiseaza = TRUE),
    message = function(m) { mesaje <<- c(mesaje, conditionMessage(m)); invokeRestart("muffleMessage") }
  )
  stopifnot(any(grepl("prea mic", mesaje)), dev.cur() == panou)
  dev.off(panou)

  # Simuleaza exact erorile raportate DOAR la previzualizare.
  pdf("panou_mare.pdf", width = 12, height = 9)
  mare <- dev.cur()
  on.exit(if (mare %in% dev.list()) dev.off(mare), add = TRUE)
  for (eroare in c("figure margins too large", "Viewport has zero dimension(s)")) {
    numar <- 0L
    desen <- function() {
      numar <<- numar + 1L
      if (numar == 2L) stop(eroare)
      plot(1:3)
    }
    suppressMessages(analiza$salveaza_si_afiseaza("previzualizare.png", desen, afiseaza = TRUE))
    stopifnot(numar == 2L, dev.cur() == mare, file.info("previzualizare.png")$size > 1000)
  }
  # O eroare reala la salvare se propaga, dar dispozitivul este inchis corect.
  eroare_salvare <- try(analiza$salveaza_si_afiseaza("invalid.png", function() stop("date invalide")), silent = TRUE)
  stopifnot(inherits(eroare_salvare, "try-error"), dev.cur() == mare)
  dev.off(mare)

  # Test de logica al addin-ului cu API RStudio simulat; nu controleaza un IDE real.
  api <- asNamespace("rstudioapi")
  originale <- lapply(c("isAvailable", "getVersion", "callFun"), get, envir = api)
  names(originale) <- c("isAvailable", "getVersion", "callFun")
  on.exit(for (n in names(originale)) assignInNamespace(n, originale[[n]], ns = "rstudioapi"), add = TRUE)
  stare <- new.env()
  stare$activ <- "cod"
  stare$doc <- list(cod = file.path(radacina, "cod_final_ACP.R"))
  stare$inchise <- character()
  assignInNamespace("isAvailable", function(...) TRUE, ns = "rstudioapi")
  assignInNamespace("getVersion", function(...) package_version("2026.1"), ns = "rstudioapi")
  assignInNamespace("callFun", function(fname, ...) {
    a <- list(...)
    switch(fname,
      getSourceEditorContext = list(id = stare$activ, path = stare$doc[[stare$activ]],
                                    contents = character(), selection = list()),
      documentPath = { p <- stare$doc[[a$id]]; if (is.null(p)) "" else p },
      documentId = stare$activ,
      documentOpen = {
        chemin <- a[[1]]
        id <- if (identical(chemin, stare$doc$cod)) "cod" else "note"
        stare$doc[[id]] <- chemin; stare$activ <- id
      },
      documentClose = {
        id <- a[[1]]; stopifnot(id == "note")
        stare$inchise <- c(stare$inchise, id); stare$doc[[id]] <- NULL; stare$activ <- "cod"
      },
      stop("API neasteptat: ", fname)
    )
  }, ns = "rstudioapi")
  acpnotes::toggle_interpretari()
  stopifnot(stare$activ == "note", length(stare$inchise) == 0)
  acpnotes::toggle_interpretari()
  stopifnot(stare$activ == "cod", length(stare$inchise) == 1)
  acpnotes::toggle_interpretari()
  # Inchidere manuala urmata de alta apasare: deschide din nou.
  stare$doc$note <- NULL; stare$activ <- "cod"
  acpnotes::toggle_interpretari()
  stopifnot(stare$activ == "note", length(stare$inchise) == 1)
  acpnotes::toggle_interpretari()
  stopifnot(stare$activ == "cod", length(stare$inchise) == 2)
  cat("\nVERIFICARE_OK: analiza, instalator, 3 PNG-uri, panou mic, erori de viewport si toggle simulat.\n")
}
verifica()
