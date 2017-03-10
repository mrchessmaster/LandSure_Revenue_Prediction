#install.package("xlsx")
library(xlsx)
#install.package("readxl")
library(readxl)


setwd("~/Desktop/STAT 306/proj/LandSure Data copy") # change this

allData = c()

readsheet <- function(i, j) {
  temp <- read_excel(paste0(i, ".xlsx"), sheet = j)
  temp <- temp[,c(2,3,4,5,8,15,16,22)]
  temp$Category <- as.character(temp$Category)
  temp <- subset(temp, Category == "LT Filing")
  temp$month = i
  return(temp)
}

for (i in c("04-14","05-14", "06-14", "07-14", "08-14", "09-14", "10-14", "11-14", "12-14", 
            "01-15", "02-15", "03-15", "04-15", "05-15", "06-15", "07-15", "08-15", "09-15", "10-15", "11-15", "12-15", 
            "01-16", "02-16", "03-16", "04-16", "05-16", "06-16", "07-16", "08-16", "09-16", "10-16", "11-16", "12-16",
            "01-17")) {
  allData <- rbind(allData, readsheet(i, 1))
  print(paste(paste("ran",i), "1"))

  allData <- rbind(allData, readsheet(i, 3))
  print(paste(paste("ran",i), "3"))
  
  # WHY IS THE DATA SO TERRIBLE????
  # 03-15 has bad sheet 4
  # 06-15 has bad sheet 4
  # 08-15 has no sheet 4
  # 10-15 has no sheet 4
  
  if (i %in% c("04-14","05-14", "06-14", "07-14", "08-14", "09-14", "10-14", "11-14", "12-14", 
               "01-15", "02-15", "04-15", "05-15", "07-15", "09-15", "11-15", "12-15")) {
    allData <- rbind(allData, readsheet(i, 4))
    print(paste(paste("ran",i), "4"))
    
  }
  
  ## do other code here

}


setwd("~/Desktop/STAT 306/proj") # change this
write.csv(allData, file = "allData.csv")


