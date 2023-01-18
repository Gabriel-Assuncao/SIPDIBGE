#' Indicate version updates of the packages inside SIPDIBGE
#' @description This function describes version updates of the packages inside SIPDIBGE.
#' @import COVIDIBGE PNADcIBGE PNSIBGE cli graphics grDevices png purrr rstudioapi tibble utils
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with version updates of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_update()
#' # Presenting information about the COVIDIBGE package
#' sipd_update(survey="COVID")
#' # Presenting information about the PNADcIBGE package
#' sipd_update(survey="PNADC")
#' # Presenting information about the PNSIBGE package
#' sipd_update(survey="PNS")}
#' @export

sipd_update <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "COVID") {
    infos <- sipd_sitrep(survey="COVID")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "PNADC") {
    infos <- SIPDIBGE::sipd_sitrep(survey="PNADC")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "PNDS") {
    message("The PNDSIBGE package is under development and will be available soon.")
    return(NULL)
    infos <- sipd_sitrep(survey="PNDS")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "PNS") {
    infos <- sipd_sitrep(survey="PNS")
    updts <- infos[infos$former==TRUE,]
  }
  else if (toupper(survey) == "POF") {
    message("The POFIBGE package was archived due to the impossibility of restructuring the files related to the survey microdata.")
    return(NULL)
    infos <- sipd_sitrep(survey="POF")
    updts <- infos[infos$former==TRUE,]
  }
  else {
    infos <- sipd_sitrep()
    updts <- infos[infos$former==TRUE,]
  }
  return(updts)
}
