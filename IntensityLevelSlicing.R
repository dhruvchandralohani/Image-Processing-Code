library(imager)
img1 <- load.image("/home/dhruv/Desktop/lenna.jpeg")
plot(img1)
img1

img1mat <- as.matrix(img1)
ilevel_mat <- matrix(0,226,226)
ilevel_mat <- img1mat

for( i in 1:225){
  for(j in 1:225){
    if( (ilevel_mat[i,j] > 0.3) && (ilevel_mat[i,j] < 0.6) ){
      ilevel_mat[i,j] <- ilevel_mat[i,j] + 1
    }
  }
}

ilevel_img <- as.cimg(ilevel_mat)
plot(ilevel_img)

