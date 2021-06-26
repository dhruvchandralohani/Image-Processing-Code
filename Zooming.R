library(imager)
img1.1 <- load.image("/home/dhruv/Desktop/Sample/test.jpeg")
img1.1
plot(img1.1)
img1 <- grayscale(img1.1)
img1
plot(img1)
wid <- width(img1)
hei <- height(img1)
img1_mat <- as.matrix(img1)
fac <- 3L
nwid <- (wid-1)*fac+1
nhei <- (hei-1)*fac+1
img2_mat <- matrix(0,nwid,nhei)
for(i in 1:wid){
  for(j in 1:hei){
    img2_mat[(i-1)*fac+1,(j-1)*fac+1] <- img1_mat[i,j]
  }
}
img3_mat <- img2_mat
irng <- nwid-fac
jrng <- nhei-fac
krng <- fac-1
i <- 1L
j <- 1L
while(i <= irng){
  j <- 1L
  while(j <= jrng){
    rdif <- img2_mat[i,j]-img2_mat[i,j+fac]
    rdif <- abs(rdif)
    rval <- rdif/fac
    for(k in 1:krng){
      img3_mat[i,j+k] <- img2_mat[i,j]+k*rval
    }
    j <- j+fac
  }
  i <- i+fac
}
plot(as.cimg(img3_mat))
img4_mat <- img3_mat
i <- 1L
j <- 1L
while(i <= irng){
  j <- 1L
  while(j <= nhei){
    cdif <- img3_mat[i,j]-img3_mat[i+fac,j]
    cdif <- abs(cdif)
    cval <- cdif/fac
    for(k in 1:krng){
      img4_mat[i+k,j] <- img3_mat[i,j]+k*cval
    }
    j <- j+1
  }
  i <- i+fac
}
plot(as.cimg(img4_mat))
  
