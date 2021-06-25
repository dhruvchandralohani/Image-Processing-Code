library(imager)
in1 <- matrix(c(0,0,0,0,0,0,0,0,12,11,10,12,15,0,0,12,11,0,11,14,0,0,13,12,12,12,10,0,0,12,10,13,12,11,0,0,0,0,0,0,0,0), 6, 7, byrow = TRUE)
in1.1 <- matrix(c(0), 4, 5)
for(i in 1:nrow(in1.1)){
  for(j in 1:ncol(in1.1)){
    in1.1[i,j] <- in1[i+1,j+1]
  }
}
plot(as.cimg(in1.1))
im3 <- load.image("/home/dhruv/Desktop/Sample/gta.jpg")
plot(im3)
out1.1 <- medianblur(im3, 3)
plot(out1.1)
out1.1 <- as.matrix(out1.1)
out1.2 <- matrix(c(0,0,0,0,0,0,0,0,11,11,11,11,11,0,0,11,11,11,12,11,0,0,11,12,12,12,11,0,0,10,12,12,12,10,0,0,0,0,0,0,0,0), 6, 7, byrow = TRUE)
plot(as.cimg(out1.2))
out1.1.1 <- matrix(c(0), 4, 5)
out1.1.2 <- matrix(c(0), 4, 5)
for(i in 1:nrow(out1.1.1)){
  for(j in 1:ncol(out1.1.1)){
    out1.1.1[i,j] <- out1.1[i+1,j+1]
  }
}
for(i in 1:nrow(out1.1.1)){
  for(j in 1:ncol(out1.1.1)){
    out1.1.2[i,j] <- out1.2[i+1,j+1]
  }
}
plot(as.cimg(out1.1.1))
save.image(as.cimg(out1.1.1),"/home/dhruv/Desktop/Sample/out1.png")
plot(as.cimg(out1.1.2))

in2 <- matrix(c(0,0,0,0,0,0,0,0,12,0,0,12,15,0,0,12,0,0,11,14,0,0,13,12,12,12,10,0,0,12,10,13,12,11,0,0,0,0,0,0,0,0), 6, 7, byrow = TRUE)
in2.2 <- matrix(c(0), 4, 5)
for(i in 1:nrow(in2.2)){
  for(j in 1:ncol(in2.2)){
    in2.2[i,j] <- in2[i+1,j+1]
  }
}
plot(as.cimg(in2.2))
out2.1 <- medianblur(as.cimg(in2), 3)
out2.1 <- as.matrix(out2.1)
out2.1.1 <- matrix(c(0), 4, 5)
for(i in 1:nrow(out2.1.1)){
  for(j in 1:ncol(out2.1.1)){
    out2.1.1[i,j] <- out2.1[i+1,j+1]
  }
}
plot(as.cimg(out2.1.1))
out2.2.2 <- matrix(c(0,0,0,11,11,0,0,0,12,11,10,12,12,12,11,10,12,12,12,10), 4, 5, byrow = TRUE)
plot(as.cimg(out2.2.2))


ex1 <- matrix(c(1), 500, 500)
for(i in 1:500){
  ex1[250, i] <- 0
  #ex1[251, i] <- 0
}
plot(as.cimg(ex1))
ex2 <- medianblur(as.cimg(ex1), 3)
ex3 <- as.matrix(ex2)
plot(as.cimg(ex2))
  