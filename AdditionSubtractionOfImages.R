library(imager)
img1 <- load.image("/home/dhruv/Desktop/mona.jpeg")
plot(img1)

img2 <- mirror(img1,"x")
plot(img2)

img3 <- img1+img2
plot(img3)       #addition of images

lenna <- load.image("/home/dhruv/Desktop/lenna.jpeg")
plot(lenna)
for(i in 1:182){
  for(j in 1:225){
    img3[i,j] <- img3[i,j]+lenna[i,j]
  }
}
plot(img3)
  
