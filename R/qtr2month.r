#' @title Quarterly to monthly deagregation
#' @description It transforsms a quarterly time series in a monthly, selecting the last month to represent the quarter.
#' @param x Variable in quarterly frequency
#' @return The correpondent monthly transformation or agregation.
#' @examples 
#' # Selecting only last month of matrix time series vintage:
#' mestri_vintage<-month2qtr(vintage[dim(vintage)[2]])
#' 
#' qtr2month(mestri_vintage)
#' 
#' 
#' @import zoo
#' @export

qtr2month<-function(x){
  data<-zoo::as.Date(x)
  datas<-seq(data[1],data[length(data)],by = 'months')
  out_x<-ts(rep(NA,length(datas)),start=  as.numeric(c(substr(as.Date(x)[1],1,4),substr(as.Date(x)[1],6,7))),frequency = 12)
  out_x[datas %in% data] <- x
  out_x<-lag(out_x,-2)
  return(out_x)
}