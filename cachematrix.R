## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  I <- NULL
  ##set the value of the vector
  set <- function(y){
    x<<-y
    I<<-NULL
  }
  ##get the value of the vector
  get <- function()   x
  ##set the value of the inverse
  setinv <- function(inverse) I<<-inverse
  ##get the value of the inverse
  getinv <- function() I
  
  list(set = set, get=get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  I <- x$getinv()
  if(!is.null(I)) {
    message("getting cached data")
    return(I)
  }
  data <- x$get()
  inverse <- solve(data,...)
  x$setinv(inverse)
  inverse
  ## Return a matrix that is the inverse of 'x'
}
##Sample solution
x<- matrix(1:4,2,2)
makeCacheMatrix(x)
cacheSolve(x)
