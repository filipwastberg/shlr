#' Get SHL Access Token
#'
#' This function creates a SHL access token.
#' @param client_id Defaults to System Envioronment variable "SPOTIFY_SHL_ID"
#' @param client_secret Defaults to System Envioronment variable "SPOTIFY_SHL_SECRET"
#' @keywords auth
#' @export
#' @examples
#' \dontrun{
#' get_shl_access_token()
#' }

get_shl_access_token <- function(client_id = Sys.getenv('SHL_CLIENT_ID'), client_secret = Sys.getenv('SHL_CLIENT_SECRET')) {

  post <- POST('https://openapi.shl.se/oauth2/token',
               accept_json(), authenticate(client_id, client_secret),
               body = list(grant_type = 'client_credentials'),
               encode = 'form', httr::config(http_version = 2)) %>% content

  if (!is.null(post$error)) {
    stop(str_glue('Could not authenticate with given SHL Open API credentials:\n\t{post$error_description}'))
  }

  access_token <- post$access_token

  return(access_token)
}

