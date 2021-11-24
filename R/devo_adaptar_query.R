#' @import stringr
#' @import dplyr
#' @title Adaptacion de query a formato API
#' @description Adaptacion de query a formato API
#' @param query Query a Devo
#' @details Adaptacion de query a formato API
#' @examples devo_adaptar_query("from tabla select campos")
#' @export

devo_adaptar_query <- function(query){
  query <- stringr::str_replace_all(query, "\n", " ")
  query <- stringr::str_replace_all(query, "\r", " ")
  query <- stringr::str_replace_all(query, "\"","\'")
}
