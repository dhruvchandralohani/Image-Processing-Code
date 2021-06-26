img1 <- load.image("/home/dhruv/Desktop/lenna.jpeg")
img1
plot(img1)

filt0 <- matrix(1,3,3)
filt1 <- matrix(0,3,3)
size <- dim(filt1)
for(i in 1:size[1]){
  for(j in 1:size[1]){
    filt1[size[1]-i+1,size[1]-j+1] <- filt0[i,j]
  }
}
filt1
div <- length(filt1)

calc_mat <- matrix(0,2*(sqrt(length(filt1))-1)+sqrt(length(img1)),2*(sqrt(length(filt1))-1)+sqrt(length(img1)))
new_mat <- calc_mat
skip <- sqrt(length(filt1))-1

rng <- dim(img1)
for(i in 1:rng[1]){
  for(j in 1:rng[1]){
    calc_mat[i+skip,j+skip] <- img1[i,j]
  }
}

vx <- c()
size <- dim(filt1)
val <- floor(size[1]/2)
val <- -val
for(i in 1:size[1]){
  vx <- append(vx,val,after = length(vx))
  val <- val +1
}
vy <- vx
endd <- dim(new_mat)
endd <- endd[1]-floor(size[1]/2)

for(i in ceiling(size[1]/2):endd){
  for(j in ceiling(size[1]/2):endd){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l],j+vy[k]]*filt1[val+vx[l],val+vy[k]]
      }
    }
    new_mat[i,j] <- new_mat[i,j]/length(filt1)
  }
}
plot(as.cimg(new_mat))

