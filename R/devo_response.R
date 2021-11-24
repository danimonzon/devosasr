#' @import dplyr
#' @import httr
#' @import vroom
#' @import stringr
#' @import lubridate
#' @title Peticion a Devo en formato epoch
#' @description Peticion de datos a Devo, en un intervalo de tiempo definido en Epoch
#' @param date_from Fecha inicio en epochtime
#' @param date_to Fecha fin en epochtime
#' @param query Query a Devo
#' @param bearer Bearer de usuario para conexión por API
#' @details Peticion de datos a Devo, en un intervalo de tiempo definido en Epoch
#' @export

devo_response <- function(date_from, date_to, query, bearer){
  query <- devo_adaptar_query(query)
  response <- httr::POST(
    url = "https://apiv2-sasr.devo.com/search/query" ,
    httr::content_type('application/json'),
    encode = "json",
    body = stringr::str_c('{', '"from":',date_from, ',"to":', date_to, ',"mode":{"type":"',"csv",'"}',',"query":"', query, '"}'),
    httr::add_headers('Authorization' = stringr::str_c('Bearer ', bearer))
  )
  tib <- vroom::vroom(rawToChar(response$content), show_col_types = FALSE)

  hay_eventdate <- sum(stringr::str_detect(names(tib), "eventdate"))

  if(hay_eventdate>=1)
    {resultado <- dplyr::mutate(tib, eventdate = lubridate::with_tz(eventdate, tzone = "CET"))}
  else
    {resultado <- tib}

  return(resultado)

}
