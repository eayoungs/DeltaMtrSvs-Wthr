
mnthAveTemps <- function(fname){
  library("lubridate")
  
  wthrData = read.csv(fname, header = TRUE, stringsAsFactors = FALSE)
  
  dateCol = colnames(wthrData[1])
  mnthAvail = unique(month(wthrData[, dateCol]))
  mnthMean = data.frame()
  
  for(i in 1:length(mnthAvail)) {
    mnthMean = rbind(data.frame(mean(wthrData[month(wthrData[, dateCol])
                     == mnthAvail[i], "Mean.TemperatureF"]), row.names = 
                     month.abb[mnthAvail[i]]), mnthMean)
  }
  write.csv(mnthMean, file = paste("MNTHMEANS-", fname))
}
