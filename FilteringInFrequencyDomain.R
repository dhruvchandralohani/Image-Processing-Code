library(imager)
img1 <- load.image("C:/College/Digital Image Processing/Images/Lenna_(test_image).png")
img1 <- grayscale(img1)
img1
plot(img1)
img1_mat <- as.matrix(img1)
val <- dim(img1)
if(val[1]>val[2])
{
  x <- val[1]
}else
{
  x <- val[2]
}
if(x%%2 != 0)
  x <- x+1
pad_mat <- matrix(0,2*x,2*x)

#padding with p=2^m and q=2^n
for(i in 1:val[1]){
  for(j in 1:val[2]){
    pad_mat[i+x/2,j+x/2] <- img1_mat[i,j]
  }
}

#multiplying with (-1)^x+y
for(i in 1:nrow(pad_mat)){
  for(j in 1:ncol(pad_mat)){
    pad_mat[i,j] <- pad_mat[i,j]*((-1)^(i+j))
  }
}
pad_img.fft <- fft(pad_mat)             #FFT of the padded image

#D(u,v) matrix
X <- 2*x
Y <- 2*x
D_mat <- matrix(0,X,Y)
for(i in 1:nrow(D_mat)){
  for(j in 1:ncol(D_mat)){
    D_mat[i,j] <- sqrt((i-X/2)^2+(j-Y/2)^2)
  }
}

D0 <- 100L

#ideal low pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    if(D_mat[i,j] <= D0){
      filt_mat[i,j] <- 1L
    }
    else{
      filt_mat[i,j] <- 0L
    }
  }
}                         #Jump to line number 104 for filter multiplication

#Butterworth low pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    filt_mat[i,j] <- (1/(1+(D_mat[i,j]/D0)^8))      # Order=n=4
  }
}                         #Jump to line number 104 for filter multiplication

#Gaussian low pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    filt_mat[i,j] <- exp(-((D_mat[i,j])^2)/(2*D0^2))
  }
}                         #Jump to line number 104 for filter multiplication

#ideal high pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    if(D_mat[i,j] >= D0){
      filt_mat[i,j] <- 1L
    }
    else{
      filt_mat[i,j] <- 0L
    }
  }
}                         #Jump to line number 104 for filter multiplication

#Butterworth high pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    filt_mat[i,j] <- (1/(1+(D0/D_mat[i,j])^8))      # Order=n=4
  }
}                         #Jump to line number 104 for filter multiplication

#Gaussian high pass filter matrix
filt_mat <- matrix(0,X,Y)
for(i in 1:nrow(filt_mat)){
  for(j in 1:ncol(filt_mat)){
    filt_mat[i,j] <- (1-exp(-((D_mat[i,j])^2)/(2*D0^2)))
  }
}                         #Jump to line number 104 for filter multiplication

#Multiplication of filter and padded image
new_img.fft <- pad_img.fft*filt_mat
new_img <- fft(new_img.fft,inverse = TRUE)/length(new_img.fft)
for(i in 1:nrow(new_img)){
  for(j in 1:ncol(new_img)){
    new_img[i,j] <- new_img[i,j]*((-1)^(i+j))
  }
}
plot(as.cimg(Re(new_img)))            #Not Cropped

img.av.fft <- fft(img1)
avg <- img.av.fft[1,1]/(nrow(img1)*ncol(img1))
avg
