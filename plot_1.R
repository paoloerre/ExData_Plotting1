#This is the script to generate the plot_1 of Exploratory Data Analysis: Assignement 1
#
#The script takes two arguments:
#the directory where the data folder is located [ default is the current workingdirectory set in R]
#and the start date in the format DD/MM/YYYY [ default is 01/02/2007 ]
#
#The script generates plot_1.png with the 2 days data starting from start_date.
#
#The Script calls another script, getTheDataSet.R which is for reading from the big dataset only the 
#rows of the 2 days to be analysed.
#
#getTheDataSet.R is to be located in the same directory as plot_1.R, specifically in the R workingdirectory
#
# 
# Author: Paolo Raffin, 22.09.2017

plot_1 <- function(workingDirectory = NULL, startDate = "01/02/2007") {
        
        source("getTheDataSet.R")
        # reading only 2 days of data
        data_x <- getTheDataSet(workingDirectory,startDate)
        
        par(mar= c(4,4,2,0), mfrow = c(1, 1))
        hist(data_x$Global_active_power, col = "red", xlab = "Global Active Power [KiloWatts]", main = "Global Active Power")
        dev.copy(png,"plot_1.png", width = 480, height = 480)
        x<-dev.off()
        
}

