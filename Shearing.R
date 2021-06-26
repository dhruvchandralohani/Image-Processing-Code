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
a <- 0
b <- 1
new_mat1 <- matrix(0,pad*2,pad*2)
for(i in 1:wid){
  for(j in 1:hei){
    x <- i+a*j
    y <- j+b*i
    new_mat1[x,y] <- img1_mat[i,j]
  }
}
plot(as.cimg(new_mat1))

