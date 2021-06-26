img1 <- load.image("/home/dhruv/Desktop/lenna.jpeg")
img1
plot(img1)
img1_mat <- as.matrix(img1)
#filt1 <- matrix(c(0,-1,0,-1,4,-1,0,-1,0),3,3)      #Laplacian
filt1 <- matrix(c(-1,-1,-1,-1,8,-1,-1,-1,-1),3,3)  #Laplacian
#filt1 <- matrix(c(-1,0,0,1),2,2)                   #Roberts
#filt1 <- matrix(c(-1,-2,-1,0,0,0,1,2,1),3,3)       #Sobel
div <- length(filt1)
rng <- dim(img1)

calc_mat <- matrix(0,2*(sqrt(length(filt1))-1)+rng[1],2*(sqrt(length(filt1))-1)+rng[2])
new_mat <- calc_mat
skip <- sqrt(length(filt1))-1

for(i in 1:rng[1]){
  for(j in 1:rng[1]){
    calc_mat[i+skip,j+skip] <- img1_mat[i,j]
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
endd1 <- endd[1]-floor(size[1]/2)
endd2 <- endd[2]-floor(size[1]/2)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l],j+vy[k]]*filt1[val+vx[l],val+vy[k]]
      }
    }
  }
}
stp <- sqrt(length(filt1))-1
size_nmat <- dim(new_mat)
x <- size_nmat[1]-stp*2
y <- size_nmat[2]-stp*2
fin_mat <- matrix(0,x,y)
for(i in 1:x){
  for(j in 1:y){
    fin_mat[i,j] <- new_mat[i+stp,j+stp]
  }
}
fin_img <- as.cimg(fin_mat)
plot(fin_img)
plot(fin_img+img1)

