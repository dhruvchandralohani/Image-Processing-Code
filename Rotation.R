library(imager)
img1 <- load.image("/home/dhruv/Desktop/Sample/coff.png")
img1 <- grayscale(img1)
plot(img1)
wid <- width(img1)
hei <- height(img1)
img1_mat <- as.matrix(img1)
if(wid > hei){
  pad <- wid
}else{
  pad <- hei
}
theta <- 45
new_mat1 <- matrix(0,pad,pad)
for(i in 1:wid){
  for(j in 1:hei){
    x <- (i*cos(theta) + j*sin(theta))
    y <- (i*sin(theta) + j*cos(theta))
    new_mat1[x,y] <- img1_mat[i,j]
  }
}
plot(as.cimg(new_mat1))
    
