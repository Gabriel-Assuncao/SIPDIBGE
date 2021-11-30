#' Show logos of the packages inside SIPDIBGE
#' @description This function shows the survey logos of the packages inside SIPDIBGE.
#' @import COVIDIBGE PNADcIBGE PNSIBGE POFIBGE cli graphics grDevices png purrr rstudioapi tibble utils
#' @param survey Name of the household survey for reference package information. If \code{NULL}, shows the logos of all the packages inside this collection, including the SIPD logo.
#' @return An image with the logos required of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_sitrep} for indicating version information for the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existence of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_logo()
#' # Presenting information about the COVIDIBGE package
#' sipd_logo(survey="COVID")
#' # Presenting information about the PNADcIBGE package
#' sipd_logo(survey="PNADC")
#' # Presenting information about the PNSIBGE package
#' sipd_logo(survey="PNS")
#' # Presenting information about the POFIBGE package
#' sipd_logo(survey="POF")}
#' @export

sipd_logo <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "COVID") {
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/covid_logo.png"))
    grDevices::dev.new()
    graphics::plot.new()
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "PNADC") {
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pnadc_logo.png"))
    grDevices::dev.new()
    graphics::plot.new()
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "PNS") {
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pns_logo.png"))
    grDevices::dev.new()
    graphics::plot.new()
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "POF") {
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pof_logo.png"))
    grDevices::dev.new()
    graphics::plot.new()
    graphics::rasterImage(logo,0,0,1,1)
  }
  else {
    sipd <- dir(system.file("extdata", package="SIPDIBGE"))
    for (i in 1:length(sipd)) {
      logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/", sipd[i]))
      grDevices::dev.new()
      graphics::plot.new()
      graphics::rasterImage(logo,0,0,1,1)
    }
  }
}
