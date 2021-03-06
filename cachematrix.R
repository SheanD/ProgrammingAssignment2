## Shean Dalton
## Put comments here that give an overall description of what your
## functions do

## Benefit
## Matrix inversion is a costly computation
## This function cache's a matrix inversion

## assumptions
## the matrix supplied is always invertible

## constraints
## use solve(x) - noted to be be good for small matrices, but slow for larger ones
## solve (a, b, tol, LINPACK = FALSE, ...)
## a: coefficients of the equation
## b: vector or matrix of the equation right side
## tol: the tolerance for detecting linear dependencies in the columns
## LINPACK: logical. ignore.
## get the inverstion matrix of x: 

## Process
## 1 set the value of the matrix
## 2 get the value of the matrix
## 3 set the value of the matrix inversion
## 4 get teh value of the matrix inversion


## Short function description
## makeCacheMatrix: this function creates a special 'matrix' object that can cache its inverse
## Null is a newly introduced object. Null values are unassigned, cannot be assigned to a vector, and is not logical (TRUE, FALSE)

makeCacheMatrix <- function(x = matrix()) {
    xinv <-NULL
    ## Set matrix to an object
    set <- function(y) {
        x <<- y
        xinv <<- NULL
    }
    ## Retrieve the Matrix
    get <- function() x
    ## set the inverse of the matrix
    setinv <- function(solve) xinv <<- solve
    getinv <- function() xinv
    ## get the inverse of the matrix
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## Short function description
## computes the inverse of the special 'matrix' returned by makeCacheMatrix above.

## constraints
## if the inverse has already been calculated (and the matrix is unchanged)
## then cache retrieves the inverse from the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## get matrix inverse
    xinv <- x$getinv()
    
    ## check if xinv is NULL or has value
    if(!is.null(xinv)) {
        message("getting cached matrix")
        return(xinv)
    }
    ## if xinv is NULL, get matrix inverse
    m <- x$get()
    xinv <- solve(m,...)
    ## set matrix inverse
    x$setinv(xinv)
    xinv
}
