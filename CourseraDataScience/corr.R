## ==================================================================
## ProgrammingAssignment #1 - corr.R
## ==================================================================
## Author: d25higgins
## Incept: Dec 7, 2014
## ==================================================================
## Description:
## A function that calls another function to get a data.frame and
## if the number of rows meets or exceeds a threshold value,
## then calculate the correlations and repeat, retrun a vector.
## ==================================================================
## Dependancy:
## This function relys on complete.R being loaded as well but since
## the outer code does that it is not included here.
## ==================================================================
## Edit History:
##
## ==================================================================

corr <- function(directory, threshold = 0){
    cleanData <- complete(directory)
    corVector <- vector(mode="numeric", length=0)
    ## if data.frame meets thrshold, calculate correlations
    #print(nrow(cleanData))
    for(i in 1:nrow(cleanData)){
        #print(cleanData[i,])
        if(cleanData[i,]$nobs > threshold){
            fileName <- buildFileName(directory, cleanData[i,]$ids)
            rawData <- read.csv(fileName)
            completeData <- rawData[complete.cases(rawData),]
            corResult <- cor(completeData$sulfate, completeData$nitrate)
            #corResult <- round(corResult, digits = 5)
            #print(corResult)
            corVector <- append(corVector, corResult)
            #print(corVector)
        }
    }
    corVector
}