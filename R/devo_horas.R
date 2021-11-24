#' @import lubridate
#' @title Peticion a Devo de las ultimas horas
#' @description Peticion de datos a Devo, de las ultimas horas
#' @param horas Horas de consulta desde el tiempo actual
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion de datos a Devo, de las ultimas horas
#' @export

devo_horas <- function(horas, query, bearer){
  date_from = as.character(lubridate::now() - lubridate::hours(horas))
  date_to = as.character(lubridate::now())
  devo_ymd_hms(date_from, date_to, query, bearer)
}
