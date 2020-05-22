## A pair of functions that cache the inverse of a matrix
## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }

## Method the get the matrix
  get <- function() x

## Method to set the inverse of the matrix
  setinverse <- function(inverse) i <<- inverse


 ## Method to get the inverse of the matrix
  getinverse <- function() i

 ## Return a list of the methods
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Compute the inverse of the special matrix returned by "makeCacheMatrix" above.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}