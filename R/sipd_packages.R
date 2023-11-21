#' Indicate names of the packages inside SIPDIBGE
#' @description This function describes the packages inside SIPDIBGE.
#' @import COVIDIBGE PNADcIBGE PNSIBGE cli graphics grDevices png purrr rstudioapi tibble utils
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with names of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existence of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_packages()
#' # Presenting information about the COVIDIBGE package
#' sipd_packages(survey="COVID")
#' # Presenting information about the PNADcIBGE package
#' sipd_packages(survey="PNADC")
#' # Presenting information about the PNDSIBGE package
#' sipd_packages(survey="PNDS")
#' # Presenting information about the PNSIBGE package
#' sipd_packages(survey="PNS")
#' # Presenting information about the POFIBGE package
#' sipd_packages(survey="POF")}
#' @export

sipd_packages <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "COVID") {
    packs <- "COVIDIBGE"
  }
  else if (toupper(survey) == "PNADC") {
    packs <- "PNADcIBGE"
  }
  else if (toupper(survey) == "PNDS") {
    message("The PNDSIBGE package is under development and will be available soon.")
    return(NULL)
    packs <- "PNDSIBGE"
  }
  else if (toupper(survey) == "PNS") {
    packs <- "PNSIBGE"
  }
  else if (toupper(survey) == "POF") {
    message("The POFIBGE package was archived due to the impossibility of restructuring the files related to the survey microdata.")
    return(NULL)
    packs <- "POFIBGE"
  }
  else {
    packs <- utils::packageDescription("SIPDIBGE")$Depends
    packs <- strsplit(packs, ",")[[1]]
    packs <- gsub("^\\s+|\\s+$", "", packs)
    packs <- vapply(strsplit(packs, "\\s+"), "[[", 1, FUN.VALUE=character(1))
    packs <- packs[endsWith(packs, "IBGE")]
    packs <- packs[!(grepl(pattern="POF", x=toupper(packs), fixed=TRUE))]
    packs <- packs[!(grepl(pattern="PNDS", x=toupper(packs), fixed=TRUE))]
  }
  return(packs)
}
