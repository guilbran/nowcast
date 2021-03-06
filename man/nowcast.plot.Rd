% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nowcast.plot.R
\name{nowcast.plot}
\alias{nowcast.plot}
\title{Plot for nowcast output function}
\usage{
nowcast.plot(out, type = "fcst")
}
\arguments{
\item{out}{Output of function nowcast}

\item{type}{'fcst', 'factors', 'eigenvalues','eigenvectors', 'month_y'}
}
\description{
Make plot to visualize the output of nowcast function
}
\examples{
\dontrun{
trans <- USGDP$Legenda$Transformation[-length(USGDP$Legenda$Transformation)]
base <- USGDP$Base[,-dim(USGDP$Base)[2]]
gdp <- month2qtr(USGDP$Base[,dim(USGDP$Base)[2]])
x <- Bpanel(base = base, trans = trans)
now <- nowcast(y = gdp, x = x, q = 2, r = 3,method = 'GRS2008')

nowcast.plot(now, type = "fcst")
nowcast.plot(now, type = "factors")
nowcast.plot(now, type = "eigenvalues")
nowcast.plot(now, type = "eigenvectors")

x2 <- Bpanel(base = base, trans = trans,aggregate = F)
now2 <- nowcast(y = gdp, x = x2, q = 2, r = 3,method = 'BR2011')

nowcast.plot(now2, type = "fcst")
nowcast.plot(now2, type = "factors")
nowcast.plot(now2, type = "eigenvalues")
nowcast.plot(now2, type = "eigenvectors")
}
}
