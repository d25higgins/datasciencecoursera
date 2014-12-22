######### Week2Assignment #########

makeVector <- function(x = numeric()){
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get, setmean = setmean, getmean = getmean)
}

cachemean <- function(x, ...){
    m <- x$getmean()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

## load week 2 assignment and run test cases.

source("ProgrammingAssignment2\cachematrix.R")
amatrix = makeCacheMatrix(matrix(c(1,2,3,4),nrow=2, ncol=2))
amatrix$get()
cacheSolve(amatrix)
amatrix$getInverse()
cacheSolve(amatrix)
amatrix$set(matrix(c(0,5,99,66), nrow=2,ncol=2))
cacheSolve(amatrix)
amatrix$get()
amatrix$getInverse()
