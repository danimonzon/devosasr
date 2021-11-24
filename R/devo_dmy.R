#' @import lubridate
#' @title Peticion a Devo en formato dmy
#' @description Peticion de datos a Devo, en un intervalo de tiempo definido dmy
#' @param date_from Fecha inicio en dmy("01-01-2021")
#' @param date_to Fecha fin en dmy("15-01-2021")
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion de datos a Devo, en un intervalo de tiempo definido dmy
#' @export

devo_dmy <- function(date_from, date_to, query, bearer){
  date_from <- as.numeric(lubridate::dmy_hms(stringr::str_c(date_from, " 00:00:00"), tz = "CET"))
  date_to <- as.numeric(lubridate::dmy_hms(stringr::str_c(date_to, " 23:59:59"), tz = "CET"))
  devo_response(date_from, date_to, query, bearer)
}
