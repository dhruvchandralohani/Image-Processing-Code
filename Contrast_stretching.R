img2 <- load.image("/home/dhruv/Desktop/man.png")
img2
plot(img2,rescale = FALSE)

img2gray <- grayscale(img2)
plot(img2gray,rescale = FALSE)

img2_matrix <- as.matrix(img2gray)
img2_matrix

max1 <- max(img2_matrix)
min1 <- min(img2_matrix)
diff <- max1-min1

img3_matrix <- matrix(0,256,256)
plot(img2_matrix,type = 'h')

for(i in 1:nrow(img2_matrix)){
  for(j in 1:ncol(img2_matrix)){
    img3_matrix[i,j] <- (img2_matrix[i,j]-min1)/diff
  }
}

res2 <- as.cimg(img3_matrix)
plot(res2)
plot(img3_matrix,type = 'h')
