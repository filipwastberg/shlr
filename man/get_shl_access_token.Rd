% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_shl_access_token.R
\name{get_shl_access_token}
\alias{get_shl_access_token}
\title{Get SHL Access Token}
\usage{
get_shl_access_token(client_id = Sys.getenv("SHL_CLIENT_ID"),
  client_secret = Sys.getenv("SHL_CLIENT_SECRET"))
}
\arguments{
\item{client_id}{Defaults to System Envioronment variable "SPOTIFY_SHL_ID"}

\item{client_secret}{Defaults to System Envioronment variable "SPOTIFY_SHL_SECRET"}
}
\description{
This function creates a SHL access token.
}
\examples{
\dontrun{
get_shl_access_token()
}
}
\keyword{auth}
