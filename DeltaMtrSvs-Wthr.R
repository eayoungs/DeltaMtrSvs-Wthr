
mnthAveTemps <- function(){
  library("lubridate")
  
  wundergrnd.FDL = read.csv("FDL_WI-KFLD_262014-2122015.csv", header = TRUE,
                            stringsAsFactors = FALSE)
  
  mnthAvail = unique(month(wundergrnd.FDL$CST))
  
  for(i in 1:length(mnthAvail)) {
    mnthMean = rbind(data.frame(mean(wundergrnd.FDL[month(wundergrnd.FDL$CST) == 
               mnthAvail[i], "Mean.TemperatureF"]), row.names = 
               month.abb[mnthAvail[i]]), mnthMean)
  }
  
  write.csv(mnthMeans, file = "FDL_WI-KFLD_262014-2122015-MNTMEANS.csv")
}
