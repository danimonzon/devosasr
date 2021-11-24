#' @import lubridate
#' @title Peticion a Devo en formato ymd_hms
#' @description Peticion de datos a Devo, en un intervalo de tiempo definido ymd_hms
#' @param date_from Fecha inicio en ymd_hms ("2021-01-01 10:00:00")
#' @param date_to Fecha fin en ymd_hms ("2021-01-01 15:00:00")
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion de datos a Devo, en un intervalo de tiempo definido ymd_hms
#' @export

devo_ymd_hms <- function(date_from, date_to, query, bearer){
  date_from <- as.numeric(lubridate::ymd_hms(date_from, tz = "CET"))
  date_to <- as.numeric(lubridate::ymd_hms(date_to, tz = "CET"))
  devo_response(date_from, date_to, query, bearer)
}
