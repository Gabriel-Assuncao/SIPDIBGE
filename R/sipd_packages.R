#' Indicate names of the packages inside SIPDIBGE
#' @description This function describes the packages inside SIPDIBGE.
#' @import PNADcIBGE POFIBGE PNSIBGE COVIDIBGE tidyverse cli purrr rstudioapi png grDevices graphics utils tibble
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with names of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version informations for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existance of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_packages()
#' sipd_packages(survey="PNADC")
#' sipd_packages(survey="POF")
#' sipd_packages(survey="PNS")
#' sipd_packages(survey="COVID")}
#' @export

sipd_packages <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "PNADC") {
    packs <- "PNADcIBGE"
  }
  else if (toupper(survey) == "POF") {
    packs <- "POFIBGE"
  }
  else if (toupper(survey) == "PNS") {
    packs <- "PNSIBGE"
  }
  else if (toupper(survey) == "COVID") {
    packs <- "COVIDIBGE"
  }
  else {
    packs <- utils::packageDescription("SIPDIBGE")$Depends
    packs <- strsplit(packs, ",")[[1]]
    packs <- gsub("^\\s+|\\s+$", "", packs)
    packs <- vapply(strsplit(packs, "\\s+"), "[[", 1, FUN.VALUE=character(1))
    packs <- packs[endsWith(packs, "IBGE")]
  }
  return(packs)
}
