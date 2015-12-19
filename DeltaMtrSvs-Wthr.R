
mnthAveTemps <- function(fname){
  library("lubridate")
  
  wthrData = read.csv(fname, header = TRUE, stringsAsFactors = FALSE)
  
  mnthAvail = unique(month(wthrData$CST))
  mnthMean = data.frame()
  
  for(i in 1:length(mnthAvail)) {
    mnthMean = rbind(data.frame(mean(wthrData[month(wthrData$CST)
                     == mnthAvail[i], "Mean.TemperatureF"]), row.names = 
                     month.abb[mnthAvail[i]]), mnthMean)
  }
  write.csv(mnthMean, file = paste("MNTHMEANS-", fname))
}
