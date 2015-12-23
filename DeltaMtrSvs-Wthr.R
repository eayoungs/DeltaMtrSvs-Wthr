# __author__ = "Eric Allen Youngson"
# __email__ = "eric@scneco.com"
# __copyright__ = "Copyright Dec. 2015, Succession Ecological Services"
# __license__ = "GNU Affero (GPLv3)"
# 
# This file contains functions for working with the results of API queries from
# DeltaMeterServices.com

# install.packages("lubridate") ## Uncomment on first execution (source)
# library("lubridate")          ## Uncomment on first execution (source)


MonthAveTemps <- function(fname){
  # 
  #
  # Args:
  #   : 
  # 
  # Returns:
  #   
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
