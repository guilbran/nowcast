% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PRTDB.R
\name{PRTDB}
\alias{PRTDB}
\title{Pseudo Real time data base}
\usage{
PRTDB(mts, delay, today = Sys.Date())
}
\arguments{
\item{mts}{A matrix time series - \code{mts} - with the series to be transformed}

\item{delay}{A numeric vector with the delay in days the information is available after the reference month. Each element correspond to the series in the respective column in \code{mts}.}

\item{today}{The day where the data is supposed to be collected.}
}
\value{
A \code{mts} with the series transformed.
}
\description{
Create a pseudo real time data base, based on delays estipulates by the users, and data inputed by the
}