library(imager)
library(magick)

img1 <- load.image("/home/dhruv/Desktop/samp.jpg")
img1
plot(img1)

img1gray <- grayscale(img1)
plot(img1gray)

img_matrix <- as.matrix(img1gray)

dim(img_matrix)#Dimensions of image 1280x720

img_matrix

img2_matrix <- matrix(0,1280,720)

#loop for flopping
for(i in 1:nrow(img_matrix))
{
  for(j in 1:ncol(img_matrix))
  {
    img2_matrix[i,j] <- img_matrix[i,ncol(img_matrix)-j+1]
  }
}
img2 <- as.cimg(img2_matrix)
plot(img2)

#loop for flipping
for(j in 1:ncol(img_matrix))
{
  for(i in 1:nrow(img_matrix))
  {
    img2_matrix[i,j] <- img_matrix[nrow(img_matrix)-i+1,j]
  }
}
img3 <-as.cimg(img2_matrix)
plot(img3)

