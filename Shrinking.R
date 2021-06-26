library(imager)
img1 <- load.image("/home/dhruv/Desktop/Sample/test.jpeg")
img1 <- grayscale(img1)
plot(img1)
wid <- width(img1)
hei <- height(img1)
img1_mat <- as.matrix(img1)
nwid <- ceiling(wid/2)
nhei <- ceiling(hei/2)
new_mat <- matrix(0,nwid,nhei)
i <- 1L
j <- 1L
k <- 1L
l <- 1L
while(i <= wid){
  j <- 1L
  l <- 1L
  while(j <= hei){
    new_mat[k,l] <- img1_mat[i,j]
    l <- l+1
    j <- j+2
  }
  i <- i+2
  k <- k+1
}
plot(as.cimg(new_mat))
