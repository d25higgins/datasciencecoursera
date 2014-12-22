## ==================================================================
## ProgrammingAssignment #1 - complete.R
## ==================================================================
## Author: d25higgins
## Incept: Dec 6, 2014
## Description:
## ==================================================================
## A function that loads pollution data from a directory of .csv 
## files and returns a data.frame that records the id of the file
## and the number of completely observerd cases.
## ==================================================================
## Edit History:
##
## ==================================================================

complete <- function(directory, id = 1:332){
    ids <- numeric(length(id))
    nobs <- numeric(length(id))
    count <- 1
    for(i in id){
        fileName <- buildFileName(directory, i)
        rawData <- read.csv(fileName)
        ids[count] <- i
        #print(nrow(rawData))
        rowCount <- nrow(rawData[complete.cases(rawData),])
        #print(rowCount)
        nobs[count] <- rowCount
        count <- count + 1
    }
    nobsData <- data.frame(ids, nobs)
    nobsData
}


## This helper function builds the file name out of the directory
## and the id number.

buildFileName <- function (directory, i) {
    converted <- paste("000", as.character(i), sep = "")
    startPos <- nchar(converted) - 2
    fileName <- paste(directory, "/", 
                      substr(converted, start = startPos, stop = nchar(converted)),
                      ".csv", sep = "")
    #print(fileName)
    fileName
}