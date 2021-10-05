#' Indicate version updates of the packages inside SIPDIBGE
#' @description This function describes version updates of the packages inside SIPDIBGE.
#' @import PNADcIBGE POFIBGE PNSIBGE COVIDIBGE cli purrr rstudioapi png grDevices graphics utils tibble
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with version updates of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_update()
#' # Presenting information about the PNADcIBGE package
#' sipd_update(survey="PNADC")
#' # Presenting information about the POFIBGE package
#' sipd_update(survey="POF")
#' # Presenting information about the PNSIBGE package
#' sipd_update(survey="PNS")
#' # Presenting information about the COVIDIBGE package
#' sipd_update(survey="COVID")}
#' @export

sipd_update <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "PNADC") {
    infos <- SIPDIBGE::sipd_sitrep(survey="PNADC")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "POF") {
    infos <- sipd_sitrep(survey="POF")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "PNS") {
    infos <- sipd_sitrep(survey="PNS")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "COVID") {
    infos <- sipd_sitrep(survey="COVID")
    updts <- infos[infos$former==TRUE,]
  }
  else {
    infos <- sipd_sitrep()
    updts <- infos[infos$former==TRUE,]
  }
  return(updts)
}
