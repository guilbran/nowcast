% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nowcast.R
\name{nowcast}
\alias{nowcast}
\title{Nowcasting of a quarterly time serie using a dynamic factor.}
\usage{
nowcast(y, x, q = NULL, r = NULL, p = NULL, method = "2sq",
  blocks = NULL)
}
\arguments{
\item{y}{Stationary quarterly time-series}

\item{x}{A time series matrix (\code{mts}) representing the regressors of interest. The series must be stationary.}

\item{q}{Dynamic rank. Number of error terms.}

\item{r}{Static rank or number of factors (r>=q) for methods 2sq and 2sm.}

\item{p}{AR order of factors.}

\item{method}{2sq: Two stages quarterly for Giannone et al. 2008; 2sm: Two stages monthly for Banbura and Runstler 2011; EM: Expected Maximization Giannone et al 2011}

\item{blocks}{only for EM method. Select which factors impact the variables (global, nominal or real).}
}
\value{
A \code{list} containing two elements:

A \code{mts} named \code{main} contains the original serie, the estimation in the sample, the estimation out of the sample;

A \code{list} named \code{factors} contains the estimated factors and coeffients.

A \code{mts} named \code{fore_x} contains the output of all regressors.

A \code{mts} named \code{month_y} contains the a monthly measure for GDP.
}
\description{
Estimate nowcasting and foreacasting for a quarterly time serie. For more details read the Vignettes.
}
\examples{
\dontrun{
# nowcast function examples:
### Method 2sq
pib<-BRGDP[,8]
y<-month2qtr(diff(diff(pib,3),12))
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = T)
q<-1
r<-2
p<-1
now_2sq<-nowcast(y,x,q,r,p,method = '2sq')

### Method 2sm
pib<-BRGDP[,8]
y<-month2qtr(diff(diff(pib,3),12))
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = F)
now_2sm<-nowcast(y,x,q,r,p,method = '2sm')

### Method EM
y<-month2qtr(diff(diff(pib,3),12))
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = F)
now_em<-nowcast(y,x,q,r,p,'EM')
}
}
\references{
Giannone, D., Reichlin, L., & Small, D. (2008). Nowcasting: The real-time informational content of macroeconomic data. Journal of Monetary Economics, 55(4), 665-676.<doi:10.1016/j.jmoneco.2008.05.010>

Bańbura, M., & Rünstler, G. (2011). A look into the factor model black box: publication lags and the role of hard and soft data in forecasting GDP. International Journal of Forecasting, 27(2), 333-346. <doi:10.1016/j.ijforecast.2010.01.011>

Bańbura M., Giannone, D. & Reichlin, L. (2011). Nowcasting, in Michael P. Clements and David F. Hendry, editors, Oxford Handbook on Economic Forecasting, pages 193-224, January 2011. <doi:10.1093/oxfordhb/9780195398649.001.0001>
}
\seealso{
\code{\link[nowcasting]{base_extraction}}
}
