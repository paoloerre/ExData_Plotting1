#This is the script for reading from the big dataset of Exploratory Data Analysis: Assignement 1
#only the rows of the 2 days to be analysed.
#
#The script takes two arguments:
#the directory where the data folder is located
#and the start date in the format DD/MM/YYYY
#
#The script is called by plot_1.R plot_2.R plot_3.R plot_4.R
#and therefore has to be located in the same directory as those ones, specifically in the R workingdirectory
#
#
# 
# Author: Paolo Raffin, 22.09.2017

getTheDataSet <- function(workingDirectory,startDate){
        
        cat("\014")
        #setting up the directory if passed
        if(!is.null(workingDirectory)){setwd(workingDirectory)}
        
        # setting up colClasses so that to read only first column
        colClasses <- c("character", rep("NULL",8))
        dates <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, colClasses = colClasses)
        
        # converting the vectore of dates in strings of characters
        dates <- format(as.Date(dates$Date, "%d/%m/%Y"),"%d/%m/%Y")
        
        # creating next day as character string. 
        # we use +2 because we need to get all the data for 48 hours starting from midnight of startDate
        nextDay <- format(as.Date(startDate, "%d/%m/%Y")+2,"%d/%m/%Y")
        
        # finding indexes of start date and start date +2 (e.g. midnight Thursday to midnight Saturday)
        rowsToRead <- match(c(startDate,nextDay), dates)
        
        # reading preliminarily only 2 rows just so to get the names to pass later when reading and skipping lines
        data_x <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, nrows = 2)
        columnNames <- names(data_x)
        
        # reading only 2 days of data
        data_x <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, skip = (rowsToRead[1]-1), nrows = (rowsToRead[2]-rowsToRead[1]), col.names = columnNames)
        data_x
        
}