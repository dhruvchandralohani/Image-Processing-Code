library(imager)
library(magick)
img1 <- image_read("/home/dhruv/Desktop/tiger.png")
plot(img1)
img1gray <- image_convert(img1,type = "grayscale")
plot(img1gray)
img1gray

img2gray <- magick2cimg(img1gray,alpha = "rm")
img2gray
plot(img2gray,rescale = FALSE)

img2_mat <- as.matrix(img2gray)
img2_mat

intensity_vector <- c()
for(i in 1:350){
  for(j in 1:350){
      intensity_vector <- append(intensity_vector,img2_mat[i,j],after = length(intensity_vector))
  }
}
unique_intensity <- c(unique(intensity_vector))
unique_intensity

intensity_matrix <- matrix(0,256,1)
for(i in 1:350){
  for(j in 1:350){
    img2_mat[i,j] <- img2_mat[i,j]*255
    intensity_matrix[img2_mat[i,j]+1] <- intensity_matrix[img2_mat[i,j]+1]+1
  }
}
intensity_matrix

probability_matrix <- matrix(0,256,1)
for(i in 1:256){
  probability_matrix[i] <- intensity_matrix[i]/length(img2_mat)
}
probability_matrix

barplot(0:255 , probability_matrix , type="h" , xlab="rk" , ylab="Pr(rk)")

sk_matrix <- matrix(-1,256,1)
sk_matrix[1] <- probability_matrix[i]*255
for(i in 2:256){
  sk_matrix[i] <- probability_matrix[i]*255 + probability_matrix[i-1]
}
sk_matrix

barplot(0:255 , sk_matrix , type = "h" , xlab = "rk" , ylab = "sk")

rounded_matrix <- matrix(0,256,1)
for(i in 1:256){
  rounded_matrix[i] <- round(sk_matrix[i])
}
rounded_matrix

sk_probability_matrix <- matrix(0,256,1)
for(i in 1:256){
  sk_probability_matrix[sk_matrix[i]] <- (sk_probability_matrix[sk_matrix[i]]+intensity_matrix[i])/length(img2_mat)
}
sk_probability_matrix

barplot(0:255 , sk_probability_matrix , type = "h" , xlab = "sk" , ylab = "Ps(sk)")

length(img2gray)

pixels_before <- 0
for(i in 1:256){
  pixels_before <- pixels_before + intensity_matrix[i,1]
}
pixels_before

pixels_after <- 0
for(i in 1:256){
  pixels_after <- pixels_after + 
}
pixels_after

