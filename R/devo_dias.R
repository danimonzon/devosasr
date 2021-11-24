#' @import lubridate
#' @title Peticion a Devo de los ultimos dias
#' @description Peticion a Devo de los ultimos dias
#' @param dias Dias de consulta desde el tiempo actual
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexion por API
#' @details Peticion a Devo de los ultimos dias
#' @export

devo_dias <- function(dias, query, bearer){
  date_from = as.character(lubridate::now() - lubridate::days(dias))
  date_to = as.character(lubridate::now())
  devo_ymd_hms(date_from, date_to, query, bearer)
}
