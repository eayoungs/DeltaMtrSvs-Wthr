
wundergrnd.FDL = read.csv("FDL_WI-KFLD_262014-2122015.csv", header = TRUE,
                          stringsAsFactors = FALSE)
mnthAvail = unique(month(wundergrnd.FDL$CST))

mnthAvailLen = length(mnthAvail)
for(i in 1:mnthAvailLen) {
  print(mean(wundergrnd.FDL[month(wundergrnd.FDL$CST) == i,"Mean.TemperatureF"]))
}
