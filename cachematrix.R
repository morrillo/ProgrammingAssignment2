## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
		}
	get <- function() x
	setinverse <- function(x) i <- x
	getinverse <- function() i
	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
	
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	library('MASS')
        ## Return a matrix that is the inverse of 'x'
	i <- x$getinverse()
	if(!is.null(i)) {
		print('getting cached data')
		return(i)
		}
	data <- x$get()
	i <- ginv(data)
	x$setinverse(i)
	i	
}
