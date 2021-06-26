img1 <- load.image("/home/dhruv/Desktop/superthumb.jpg")
plot(img1)
img1

img1gray <- grayscale(img1)
plot(img1gray)
img1gray

img1_mat <- as.matrix(img1gray)
img2_mat <- matrix(0,300,250)
for(i in 1:300){
  for(j in 1:250){
    img2_mat[i,j] <- 256 - (255*img1_mat[i,j])
  }
}
img2_mat

neg_img <- as.cimg(img2_mat)
plot(neg_img)
