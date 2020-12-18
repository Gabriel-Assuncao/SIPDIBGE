#' Indicate conflicts of the packages inside SIPDIBGE
#' @description This function describes conflicts between functions of the packages inside SIPDIBGE and another installed packages.
#' @import PNADcIBGE POFIBGE PNSIBGE COVIDIBGE tidyverse cli purrr rstudioapi png grDevices graphics utils tibble
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with conflits of functions of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version informations for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existance of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_conflicts()
#' sipd_conflicts(survey="PNADC")
#' sipd_conflicts(survey="POF")
#' sipd_conflicts(survey="PNS")
#' sipd_conflicts(survey="COVID")}
#' @export

sipd_conflicts <- function(survey = NULL) {
  packs <- purrr::set_names(grep("^package:", search(), value=TRUE))
  funcs <- NULL
  for (i in 1:length(packs)) {
    funcs <- c(funcs, ls(packs[i]))
  }
  confs <- names(table(funcs)[table(funcs) > 1])
  if (toupper(survey) == "PNADC") {
    sipd <- ls("package:PNADcIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "POF") {
    sipd <- ls("package:POFIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "PNS") {
    sipd <- ls("package:PNSIBGE")
    confs <- confs[confs %in% sipd]
  }
  else if (toupper(survey) == "COVID") {
    sipd <- ls("package:COVIDIBGE")
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
