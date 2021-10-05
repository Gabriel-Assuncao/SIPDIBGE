#' Indicate version information of the packages inside SIPDIBGE
#' @description This function describes version information of the packages inside SIPDIBGE.
#' @import PNADcIBGE POFIBGE PNSIBGE COVIDIBGE cli purrr rstudioapi png grDevices graphics utils tibble
#' @param survey Name of the household survey for reference package information. If \code{NULL}, presents the information of all the packages inside this collection.
#' @return A vector with version information of the packages inside SIPDIBGE.
#' @note For more information, visit the survey official website <\url{https://www.ibge.gov.br/}> and consult the other functions of this package, described below.
#' @seealso \link[SIPDIBGE]{sipd_conflicts} for indicating conflicts of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_deps} for indicating dependencies of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_logo} for showing logos of the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_packages} for indicating the packages inside SIPDIBGE.\cr \link[SIPDIBGE]{sipd_update} for indicating the existence of an update for the packages inside SIPDIBGE.
#' @examples
#' \donttest{
#' sipd_sitrep()
#' # Presenting information about the PNADcIBGE package
#' sipd_sitrep(survey="PNADC")
#' # Presenting information about the POFIBGE package
#' sipd_sitrep(survey="POF")
#' # Presenting information about the PNSIBGE package
#' sipd_sitrep(survey="PNS")
#' # Presenting information about the COVIDIBGE package
#' sipd_sitrep(survey="COVID")}
#' @export

sipd_sitrep <- function(survey = NULL) {
  options(repos=structure(c(CRAN="https://cran.r-project.org/")))
  if (is.null(survey) | !is.character(survey)) {
    survey <- "SIPD"
  }
  cli::cat_bullet("R: ", getRversion())
  if (rstudioapi::isAvailable()) {
    cli::cat_bullet("RStudio: ", rstudioapi::getVersion())
  }
  packs <- utils::available.packages(repos=getOption("repos"))
  if (toupper(survey) == "PNADC") {
    deps <- unique(sort(c("PNADcIBGE", unlist(SIPDIBGE::sipd_deps(survey="PNADC")))))
    base <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk", "utils")
    deps <- setdiff(deps, base)
    tool <- c("cli", "crayon", "rstudioapi")
    deps <- setdiff(deps, tool)
    cran <- lapply(packs[deps, "Version"], base::package_version)
    local <- lapply(deps, utils::packageVersion)
    former <- purrr::map2_lgl(cran, local, `>`)
    infos <- tibble::tibble(package=deps, cran=cran %>% purrr::map_chr(as.character), local=local %>% purrr::map_chr(as.character), former=former)
  }
  else if (toupper(survey) == "POF") {
    deps <- unique(sort(c("POFIBGE", unlist(SIPDIBGE::sipd_deps(survey="POF")))))
    base <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk", "utils")
    deps <- setdiff(deps, base)
    tool <- c("cli", "crayon", "rstudioapi")
    deps <- setdiff(deps, tool)
    cran <- lapply(packs[deps, "Version"], base::package_version)
    local <- lapply(deps, utils::packageVersion)
    former <- purrr::map2_lgl(cran, local, `>`)
    infos <- tibble::tibble(package=deps, cran=cran %>% purrr::map_chr(as.character), local=local %>% purrr::map_chr(as.character), former=former)
  }
  else if (toupper(survey) == "PNS") {
    deps <- unique(sort(c("PNSIBGE", unlist(SIPDIBGE::sipd_deps(survey="PNS")))))
    base <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk", "utils")
    deps <- setdiff(deps, base)
    tool <- c("cli", "crayon", "rstudioapi")
    deps <- setdiff(deps, tool)
    cran <- lapply(packs[deps, "Version"], base::package_version)
    local <- lapply(deps, utils::packageVersion)
    former <- purrr::map2_lgl(cran, local, `>`)
    infos <- tibble::tibble(package=deps, cran=cran %>% purrr::map_chr(as.character), local=local %>% purrr::map_chr(as.character), former=former)
  }
  else if (toupper(survey) == "COVID") {
    deps <- unique(sort(c("COVIDIBGE", unlist(SIPDIBGE::sipd_deps(survey="COVID")))))
    base <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk", "utils")
    deps <- setdiff(deps, base)
    tool <- c("cli", "crayon", "rstudioapi")
    deps <- setdiff(deps, tool)
    cran <- lapply(packs[deps, "Version"], base::package_version)
    local <- lapply(deps, utils::packageVersion)
    former <- purrr::map2_lgl(cran, local, `>`)
    infos <- tibble::tibble(package=deps, cran=cran %>% purrr::map_chr(as.character), local=local %>% purrr::map_chr(as.character), former=former)
  }
  else {
    deps <- unique(sort(c(sipd_packages(), unlist(SIPDIBGE::sipd_deps()))))
    base <- c("base", "compiler", "datasets", "graphics", "grDevices", "grid", "methods", "parallel", "splines", "stats", "stats4", "tools", "tcltk", "utils")
    deps <- setdiff(deps, base)
    tool <- c("cli", "crayon", "rstudioapi")
    deps <- setdiff(deps, tool)
    cran <- lapply(packs[deps, "Version"], base::package_version)
    local <- lapply(deps, utils::packageVersion)
    former <- purrr::map2_lgl(cran, local, `>`)
    infos <- tibble::tibble(package=deps, cran=cran %>% purrr::map_chr(as.character), local=local %>% purrr::map_chr(as.character), former=former)
  }
  return(infos)
}
