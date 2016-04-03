# __author__ = "Eric Allen Youngson"
# __email__ = "eric@successionecological.com"
# __copyright__ = "Copyright Dec. 2015, Succession Ecological Services"
# __license__ = "GNU Affero (GPLv3)"
# 
# This file contains functions for working with the results of API queries from
# DeltaMeterServices.com

# install.packages("lubridate") ## Uncomment on first execution (source)
library("lubridate")          ## Uncomment on first execution (source)


MonthAveTemps <- function(fname){
  # 
  #
  # Args:
  #   : 
  # 
  # Returns:
  #   
  wthrData = read.csv(fname, header = TRUE, stringsAsFactors = FALSE)
  
  dateCol = colnames(wthrData[3])
  mnthAvail = unique(month(wthrData[, dateCol]))
  mnthMean = data.frame()
  
  for(i in 1:length(mnthAvail)) {
    mnthMean = rbind(data.frame(Month = mnthAvail[i], Mean.Temp = mean(wthrData[month(wthrData[, dateCol])
                     == mnthAvail[i], "AirTemp"]), row.names = 
                     month.abb[mnthAvail[i]]), mnthMean)
    mnthMean = mnthMean[order(mnthMean$Month),]
  }
  write.csv(mnthMean, file = paste("MNTHMEANS-", fname))
}
