#' @title
#' Retrieve descriptive information from ENGIE's open wind farm
#'
#' @description
#' The \code{\link[openwindfarm]{get_info}} function downloads the dataset
#' describing the 34 measurements that compose the .
#'
#' @param ...
#' Additional parameters to be passed to \code{\link[httr]{GET}}.
#'
#' @return
#' The dataset downloaded is returned invisibly.
#'
#' @seealso
#' \code{\link[openwindfarm]{get_owf}}.
#'
#' @importFrom dplyr arrange
#' @importFrom httr GET stop_for_status
#' @importFrom magrittr %>%
#' @importFrom readr cols col_character read_delim
#' @export
#'
get_info <-
function(...)
{
  variable_name <- NULL

  r <- httr::GET(url_owf(), query = list(dataset = "data_description"), ...)
  httr::stop_for_status(r)

  col_types <- readr::cols(.default = readr::col_character())
  df <- readr::read_delim(r$content, delim = ";", col_types = col_types) %>%
    dplyr::arrange(variable_name)
  names(df) <- capitalize(names(df))

  invisible(df)
}
