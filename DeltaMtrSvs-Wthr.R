
mnthAveTemps <- function(fname){
  library("lubridate")
  
  wundergrnd.FDL = read.csv(fname, header = TRUE,
                            stringsAsFactors = FALSE)
  
  mnthAvail = unique(month(wundergrnd.FDL$CST))
  mnthMean = data.frame()
  
  for(i in 1:length(mnthAvail)) {
    mnthMean = rbind(data.frame(mean(wundergrnd.FDL[month(wundergrnd.FDL$CST)
                     == mnthAvail[i], "Mean.TemperatureF"]), row.names = 
                     month.abb[mnthAvail[i]]), mnthMean)
  }
  write.csv(mnthMean, file = paste("MNTHMEANS-", fname))
}
