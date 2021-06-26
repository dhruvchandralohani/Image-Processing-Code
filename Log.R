img1 <- image_read("/home/dhruv/Desktop/doc.png")
plot(img1)
img1gray <- image_convert(img1,type = "grayscale")
plot(img1gray)
img1gray

img2gray <- magick2cimg(img1gray,alpha = "rm")
img2gray
plot(img2gray,rescale = FALSE)

img2_mat <- as.matrix(img2gray)

img_log <- matrix(0,220,445)
for(i in 1:220){
  for(j in 1:445){
    img_log[i,j] <- log(1 + img2_mat[i,j])
  }
}

log_img <- as.cimg(img_log)
plot(log_img)
