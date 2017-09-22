#This is the script to generate the plot_2 of Exploratory Data Analysis: Assignement 1
#
#The script takes two arguments:
#the directory where the data folder is located [ default is the current workingdirectory set in R]
#and the start date in the format DD/MM/YYYY [ default is 01/02/2007 ]
#
#The script generates plot_2.png with the 2 days data starting from start_date.
#
#The Script calls another script, getTheDataSet.R which is for reading from the big dataset only the 
#rows of the 2 days to be analysed.
#
#getTheDataSet.R is to be located in the same directory as plot_1.R, specifically in the R workingdirectory
#
# 
# Author: Paolo Raffin, 22.09.2017

plot_2 <- function(workingDirectory = NULL, startDate = "01/02/2007") {
        
        source("getTheDataSet.R")
        # reading only 2 days of data
        data_x <- getTheDataSet(workingDirectory,startDate)
        
        # creating x axis including date and time
        x_axis <- strptime(paste(data_x$Date,as.character(data_x$Time)), format = "%d/%m/%Y %H:%M:%S")
        
        par("col"="black", "mar"= c(2,4,2,1),mfrow = c(1, 1))
        plot(x_axis,data_x$Global_active_power,col = "black", ylab = "Global Active Power [KiloWatts]", pch = ".")
        lines(x_axis,data_x$Global_active_power, col= "black")
        dev.copy(png,"plot_2.png", width = 480, height = 480)
        x<-dev.off()
        
        
}
