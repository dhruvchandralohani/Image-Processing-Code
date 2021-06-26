#for 1D-image
imgO <- c(0,1,0,1,0,0,1,1,0)    #image
imgO
img1 <- imgO
filt0 <- c(2,3,4,7)         #filter
filt0
j <- 1L
filt1 <- vector(mode = "numeric" , length(filt0))
for(i in length(filt1):1){
  filt1[j] <- filt0[i]
  j <-j+1
}
filt1           #180 degree rotated filter
padd <- length(filt1) - 1

for(i in 1:padd){
  img1 <- append(img1,0,after = 0)              #padding in front
}
for(i in 1:padd){
  img1 <- append(img1,0,after = length(img1))   #padding at end
}
img1

v <- vector(mode = "numeric" , length = length(img1))
rnge <- length(img1)-length(filt1)
rnge <- rnge +1
for(i in 1:rnge){
  for(s in 1:length(filt1)){
    v[i+padd] <- v[i+padd] + img1[i+s-1]*filt1[s]
  }
}
#filtered image
v
