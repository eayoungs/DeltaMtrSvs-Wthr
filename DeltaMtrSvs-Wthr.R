wundergrnd.FDL = read.csv('FDL_WI-KFLD_262014-2122015.csv', header = TRUE, stringsAsFactors = FALSE)

mean(wundergrnd.FDL[month(wundergrnd.FDL$CST) == 2,"Mean.TemperatureF"])