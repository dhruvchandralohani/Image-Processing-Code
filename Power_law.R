img1 <- load.image("/home/dhruv/Desktop/einstein.jpg")
plot(img1 , rescale = FALSE)
img1

img1gray <- grayscale(img1)
plot(img1gray , rescale = FALSE)
img1gray

Gamma <- readline(prompt = "\nEnter a value of Gamma:")
  
img1mat <- as.matrix(img1gray)
pow_mat <- matrix(0,186,182)

for(i in 1:186){
  for(j in 1:182){
    pow_mat[i,j] <- img1mat[i,j] ^ as.numeric(Gamma)
  }
}

pow_img <- as.cimg(pow_mat)
plot(pow_img)
