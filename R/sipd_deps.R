#' Indicate dependecies of the packages inside SIPDIBGE
#' @description This function describes packages in dependencies list of the packages inside SIPDIBGE.
#' @import PNADcIBGE POFIBGE PNSIBGE COVIDIBGE tidyverse cli purrr rstudioapi png grDevices graphics utils tibble
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with packages in dependencies list of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version informations for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existance of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_deps()
#' sipd_deps(survey="PNADC")
#' sipd_deps(survey="POF")
#' sipd_deps(survey="PNS")
#' sipd_deps(survey="COVID")}
#' @export

sipd_deps <- function(survey = NULL) {
  if (toupper(survey) == "PNADC") {
    deps <- tools::package_dependencies("PNADcIBGE")
  }
  else if (toupper(survey) == "POF") {
    deps <- tools::package_dependencies("POFIBGE")
  }
  else if (toupper(survey) == "PNS") {
    deps <- tools::package_dependencies("PNSIBGE")
  }
  else if (toupper(survey) == "COVID") {
    deps <- tools::package_dependencies("COVIDIBGE")
  }
  else {
    sipd <- SIPDIBGE::sipd_packages()
    deps <- tools::package_dependencies(sipd)
  }
  return(deps)
}
