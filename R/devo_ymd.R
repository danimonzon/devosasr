#' @import lubridate
#' @title Peticion a Devo en formato ymd
#' @description Peticion de datos a Devo, en un intervalo de tiempo definido ymd
#' @param date_from Fecha inicio en ymd("2021-01-01")
#' @param date_to Fecha fin en ymd("2021-01-15")
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion de datos a Devo, en un intervalo de tiempo definido ymd
#' @export

devo_ymd <- function(date_from, date_to, query, bearer){
  date_from <- as.numeric(lubridate::ymd_hms(stringr::str_c(date_from, " 00:00:00"), tz = "CET"))
  date_to <- as.numeric(lubridate::ymd_hms(stringr::str_c(date_to, " 23:59:59"), tz = "CET"))
  devo_response(date_from, date_to, query, bearer)
}
