#' Show logos of the packages inside SIPDIBGE
#' @description This function shows the survey logos of the packages inside SIPDIBGE.
#' @import COVIDIBGE PNADcIBGE PNSIBGE cli graphics grDevices png purrr rstudioapi tibble utils
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
#' sipd_logo(survey="PNS")}
#' @export

sipd_logo <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  grDevices::dev.new()
  graphics::plot.new()
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  if (toupper(survey) == "COVID") {
    grDevices::dev.new()
    graphics::plot.new()
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/covid_logo.png"))
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "PNADC") {
    grDevices::dev.new()
    graphics::plot.new()
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pnadc_logo.png"))
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "PNDS") {
    message("The PNDSIBGE package is under development and will be available soon.")
    return(NULL)
    grDevices::dev.new()
    graphics::plot.new()
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pnds_logo.png"))
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "PNS") {
    grDevices::dev.new()
    graphics::plot.new()
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pns_logo.png"))
    graphics::rasterImage(logo,0,0,1,1)
  }
  else if (toupper(survey) == "POF") {
    message("The POFIBGE package was archived due to the impossibility of restructuring the files related to the survey microdata.")
    return(NULL)
    grDevices::dev.new()
    graphics::plot.new()
    logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/pof_logo.png"))
    graphics::rasterImage(logo,0,0,1,1)
  }
  else {
    sipd <- dir(system.file("extdata", package="SIPDIBGE"))
    sipd <- sipd[!(grepl(pattern="POF", x=toupper(sipd), fixed=TRUE))]
    sipd <- sipd[!(grepl(pattern="PNDS", x=toupper(sipd), fixed=TRUE))]
    for (i in 1:length(sipd)) {
      grDevices::dev.new()
      graphics::plot.new()
      logo <- png::readPNG(paste0(system.file("extdata", package="SIPDIBGE"), "/", sipd[i]))
      graphics::rasterImage(logo,0,0,1,1)
    }
  }
}
