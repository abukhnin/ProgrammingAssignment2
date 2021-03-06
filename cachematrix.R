## Matrix inversion is usually a costly computation 
## and there may be some benefit to caching the inverse of a matrix 
## rather than compute it repeatedly. 
## The functions below implement caching the inverse of a matrix.   


## makeCacheMatrix function creates a special "matrix" object 
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	
	set <- function(y) {
		x <<- y
		inverse <<- NULL
	}
	
	get <- function() x
	
	setInverse <- function(anInverse) inverse <<- anInverse
	
	getInverse <- function() inverse
	
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve 
## retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
	inverse <- x$getInverse()
	
	if(!is.null(inverse)) {
		message("getting cached data")
		return(inverse)
	}
	
	data <- x$get()
	
	inverse <- solve(data, ...)
	
	x$setInverse(inverse)
	
	inverse
}
