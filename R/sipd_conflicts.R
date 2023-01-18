#' Indicate conflicts of the packages inside SIPDIBGE
#' @description This function describes conflicts between functions of the packages inside SIPDIBGE and another installed packages.
#' @import COVIDIBGE PNADcIBGE PNSIBGE cli graphics grDevices png purrr rstudioapi tibble utils
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with conflicts of functions of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existence of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_conflicts()
#' # Presenting information about the COVIDIBGE package
#' sipd_conflicts(survey="COVID")
#' # Presenting information about the PNADcIBGE package
#' sipd_conflicts(survey="PNADC")
#' # Presenting information about the PNSIBGE package
#' sipd_conflicts(survey="PNS")}
#' @export

sipd_conflicts <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  packs <- purrr::set_names(grep("^package:", search(), value=TRUE))
  funcs <- NULL
  for (i in 1:length(packs)) {
    funcs <- c(funcs, ls(packs[i]))
  }
  confs <- names(table(funcs)[table(funcs) > 1])
  if (toupper(survey) == "COVID") {
    sipd <- ls("package:COVIDIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "PNADC") {
    sipd <- ls("package:PNADcIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "PNDS") {
    message("The PNDSIBGE package is under development and will be available soon.")
    return(NULL)
    sipd <- ls("package:PNDSIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "PNS") {
    sipd <- ls("package:PNSIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "POF") {
    message("The POFIBGE package was archived due to the impossibility of restructuring the files related to the survey microdata.")
    return(NULL)
    sipd <- ls("package:POFIBGE")
    confs <- confs[confs %in% sipd]
  }
  else {
    sipd <- paste0("package:", SIPDIBGE::sipd_packages())
    funcs <- NULL
    for (i in 1:length(sipd)) {
      funcs <- c(funcs, ls(sipd[i]))
    }
    confs <- confs[confs %in% funcs]
  }
  return(confs)
}
