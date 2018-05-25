# Julia set example from:
# http://www.laketide.com/julia-vs-r-vs-python/

# Set detail and resolution
detail <- 1000
h <- 6000
w = 6000

c <- complex( real = (0.6180339887498949-2) , imaginary = (0.6180339887498949-1) )

julia_fractal <- function( z, c, max ) {
for (i in 1:max) {
  if (Mod(z)>2) return(i)
  z <- z^2 + c 
}
return(max)
}

generate_julia_set <- function( h, w, c, l) {
bitmap = matrix(0,h,w)
for (x in 1:w) {
  for (y in 1:h){
    z <- complex( real =  3.*(x-w/2.)/w, imaginary = 3.*(y-h/2.)/h ) # scale for proportion in Bitmap
    bitmap[x,y] <- julia_fractal( z, c, l)/l
}}
return(bitmap)
}

t0 <- Sys.time()
bitmap <- generate_julia_set( h,w,c,detail) 
t1 <- Sys.time()
print(t1-t0)
