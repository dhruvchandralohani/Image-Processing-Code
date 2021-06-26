library(imager)
img1 <- load.image("/home/dhruv/Desktop/Sample/original.jpg")
img1 <- grayscale(img1)
plot(img1)
wid <- width(img1)
hei <- height(img1)
img1_mat <- as.matrix(img1)
#Don't make x > wid OR y > hei.
x <- 50L
y <- 60L
new_mat1 <- matrix(0,wid+x,hei+y)
for(i in 1:wid){
  for(j in 1:hei){
    new_mat1[i+x,j+y] <- img1_mat[i,j]
  }
}
plot(as.cimg(new_mat1))
#------------------------------------------OR------------------------------------------#
new_mat2 <- matrix(0,wid,hei)
for(i in 1:(wid-x)){
  for(j in 1:(hei-y)){
    new_mat2[i+x,j+y] <- img1_mat[i,j]
  }
}
plot(as.cimg(new_mat2))
