## ==================================================================
## ProgrammingAssignment #3 - Section 1
## ==================================================================
## Author: d25higgins
## Incept: Dec 13, 2014
## Description:
## ==================================================================
## Assignment 3 stuff
## ==================================================================
## Edit History:
##
## ==================================================================

outcome <- read.csv("hospitalData/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

source("../best.R")

best("TX", "heart attack")
##[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
best("TX", "heart failure")
##[1] "FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack")
##[1] "JOHNS HOPKINS HOSPITAL, THE"
best("MD", "pneumonia")
##[1] "GREATER BALTIMORE MEDICAL CENTER"
best("BB", "heart attack")
##Error in best("BB", "heart attack") : invalid state
best("NY", "hert attack")
##Error in best("NY", "hert attack") : invalid outcome


source("../rankhospital.R")
getrank("best", 300)
getrank("worst", 300)
getrank(4,300)
getrank(500, 300)

rankhospital("TX", "heart failure", 4)
##[1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
##[1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
##[1] NA

source("rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)


