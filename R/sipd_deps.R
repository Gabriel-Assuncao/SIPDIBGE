#' Indicate dependencies of the packages inside SIPDIBGE
#' @description This function describes packages in dependencies list of the packages inside SIPDIBGE.
#' @import COVIDIBGE PNADcIBGE PNDSIBGE PNSIBGE cli graphics grDevices png purrr rstudioapi tibble utils
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with packages in dependencies list of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existence of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_deps()
#' # Presenting information about the COVIDIBGE package
#' sipd_deps(survey="COVID")
#' # Presenting information about the PNADcIBGE package
#' sipd_deps(survey="PNADC")
#' # Presenting information about the PNDSIBGE package
#' sipd_deps(survey="PNDS")
#' # Presenting information about the PNSIBGE package
#' sipd_deps(survey="PNS")
#' # Presenting information about the POFIBGE package
#' sipd_deps(survey="POF")}
#' @export

sipd_deps <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  packs <- utils::available.packages(repos=getOption("repos"))
  if (toupper(survey) == "COVID") {
    deps <- tools::package_dependencies("COVIDIBGE", packs)
  }
  else if (toupper(survey) == "PNADC") {
    deps <- tools::package_dependencies("PNADcIBGE", packs)
  }
  else if (toupper(survey) == "PNDS") {
    message("The PNDSIBGE package is under development and will be available soon.\n")
    return(NULL)
    deps <- tools::package_dependencies("PNDSIBGE", packs)
  }
  else if (toupper(survey) == "PNS") {
    deps <- tools::package_dependencies("PNSIBGE", packs)
  }
  else if (toupper(survey) == "POF") {
    message("The POFIBGE package was archived due to the impossibility of restructuring the files related to the survey microdata.\n")
    return(NULL)
    deps <- tools::package_dependencies("POFIBGE", packs)
  }
  else {
    sipd <- SIPDIBGE::sipd_packages()
    deps <- tools::package_dependencies(sipd, packs)
  }
  return(deps)
}
