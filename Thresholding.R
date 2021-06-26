nimg1 <- load.image("/home/dhruv/Desktop/original (1).jpg")
nimg1
plot(nimg1)

nimg1gray <- grayscale(nimg1)
nimg1gray
plot(nimg1gray)

nimg1matrix <- as.matrix(nimg1gray)
nimg1matrix[500,625]

for(i in 1:500){
  for(j in 1:625){
    if(nimg1matrix[i,j] < 0.07){
      nimg1matrix[i,j] <- 1
    }
    else{
      nimg1matrix[i,j] <- 0
    }
  }
}

nimg2 <- as.cimg(nimg1matrix)
plot(nimg2)
  
