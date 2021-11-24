#' @import lubridate
#' @title Peticion a Devo en formato dmy_hms
#' @description Peticion de datos a Devo, en un intervalo de tiempo definido dmy_hms
#' @param date_from Fecha inicio en dmy_hms ("01-01-2021 10:00:00")
#' @param date_to Fecha fin en dmy_hms ("01-01-2021 15:00:00")
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion de datos a Devo, en un intervalo de tiempo definido dmy_hms
#' @export

devo_dmy_hms <- function(date_from, date_to, query, bearer){
  date_from <- as.numeric(lubridate::dmy_hms(date_from, tz = "CET"))
  date_to <- as.numeric(lubridate::dmy_hms(date_to, tz = "CET"))
  devo_response(date_from, date_to, query, bearer)
}
