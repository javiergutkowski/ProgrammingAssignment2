## How to use this functions
## > b<-matrix(1:4,2,2)
## > a<-makeCacheMatrix(b)
## > cacheSolve(a)
## The basic assumption is that the input is a square matrix that is invertible.

## This function gets a matrix and Creates a Matrix object in the cache. 
## In addition it define 4 methods: set/get/setsolve/getsolve.
 
makeCacheMatrix<- function(mtx = matrix()) {
        result <- NULL
        set <- function(mtxObj) {
                mtx <<- mtxObj
                result <<- NULL
        }
        get <- function() mtx
        setsolve <- function(solve) result <<- solve
        getsolve <- function() result
        list(set = set, 
             get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## This function calculates the Matrix Inversion (solve).
## The function gets the object created by makeCacheMatrix. 
## In case the matrix was already calculated, takes the result from the cache.
## cacheSolve use the methods defined in makeCacheMatrix.
 
cacheSolve<- function(mtx, ...) {
        result <- mtx$getsolve()
        if(!is.null(result)) {
                message("getting cached data")
                return(result)
        }
        data <- mtx$get()
        result <- solve(data, ...)
        mtx$setsolve(result)
        result
}

