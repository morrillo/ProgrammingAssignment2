## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Builds list with matrix that holds setters and getters for the matrix data functions and setters and getters for the inverse information
makeCacheMatrix <- function(x = matrix()) {
	# sets inverse data to null
	i <- NULL
	# setter function
	set <- function(y) {
		x <<- y
		i <<- NULL
		}
	# getter function for matrix data
	get <- function() x
	# sets inverse information
	setinverse <- function(x) {
		i <<- x
		}
	# gets inverse function
	getinverse <- function() i
	list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
	
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
	# loads package with ginv function
	library('MASS')
        ## Obtains inverse
	i <- x$getinverse()
	if(!is.null(i)) {
                print("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- ginv(data)
        x$setinverse(i)
	i 
}

