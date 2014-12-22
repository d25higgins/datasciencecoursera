## ==================================================================
## ProgrammingAssignment #1 - pollutantmean.R
## ==================================================================
## Author: d25higgins
## Incept: Dec 6, 2014
## Description:
## ==================================================================
## A function that loads pollution data from a directory of .csv 
## files and returns the mean for the pollutant accross all of the
## monitors while ignoring missing data.
## ==================================================================
## Edit History:
##
## ==================================================================

pollutantmean <- function(directory, pollutant, id = 1:332){
    ## create vector to hold data
    polData <- NULL
    allMonData <- NULL
    for(i in id){
        ## load data from file into dataframe
        fileName <- buildFileName(directory, i)
        monData <- read.csv(fileName)
        if(identical(pollutant,"sulfate")){
            polData <- monData$sulfate           
        } else if(identical(pollutant, "nitrate")){
            polData <- monData$nitrate
        }
        ## clean the data
        #cleanData <- cleanPollutantData(polData)
        ## append the data to the vector
        allMonData <- append(allMonData, polData)
    }
    ## calculate and return the mean
    round(mean(allMonData, na.rm = TRUE), digits = 3)
}

cleanPollutantData <- function(v){
    bad <- is.na(v)
    v[!bad]
}

buildFileName <- function (directory, i) {
    converted <- paste("000", as.character(i), sep = "")
    startPos <- nchar(converted) - 2
    fileName <- paste(directory, "/", 
                      substr(converted, start = startPos, stop = nchar(converted)),
                      ".csv", sep = "")
    #print(fileName)
    fileName
}