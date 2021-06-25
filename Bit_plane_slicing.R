library(imager)
img1 <- load.image("/home/dhruv/Desktop/mona.jpeg")
plot(img1)
img1

img1mat <- as.matrix(img1)
new_mat <- matrix(0,183,277)

#first bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],1)
  }
}
im1 <- as.cimg(new_mat)
plot(im1)

#second bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],2)
  }
}
im2 <- as.cimg(new_mat)
plot(im2)

#third bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],4)
  }
}
im3 <- as.cimg(new_mat)
plot(im3)

#fourth bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],8)
  }
}
im4 <- as.cimg(new_mat)
plot(im4)

#fifth bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],16)
  }
}
im5 <- as.cimg(new_mat)
plot(im5)

#sixth bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],32)
  }
}
im6 <- as.cimg(new_mat)
plot(im6)

#seventh bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],64)
  }
}
im7 <- as.cimg(new_mat)
plot(im7)

#eigth bit-plane
new_mat <- img1mat
for(i in 1:182){
  for(j in 1:276){
    new_mat[i,j] <- new_mat[i,j]*255
    new_mat[i,j] <- bitwAnd(new_mat[i,j],128)
  }
}
im8 <- as.cimg(new_mat)
plot(im8)

par(mfrow = c(2,4))
plot(im1)
plot(im2)
plot(im3)
plot(im4)
plot(im5)
plot(im6)
plot(im7)
plot(im8)


flip1 <- mirror(img1,"x")
plot(flip1 + img1)
