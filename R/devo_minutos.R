#' @import lubridate
#' @title Peticion a Devo de los ultimos minutos
#' @description Peticion de datos a Devo, de los ultimos minutos
#' @param minutos Minutos de consulta desde el tiempo actual
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexión por API
#' @details Peticion de datos a Devo, de los ultimos minutos
#' @export

devo_minutos <- function(minutos, query, bearer){
  date_from = as.character(lubridate::now() - lubridate::minutes(minutos))
  date_to = as.character(lubridate::now())
  devo_ymd_hms(date_from, date_to, query, bearer)
}
