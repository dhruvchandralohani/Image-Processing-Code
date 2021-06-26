library(imager)
img2 <- load.image("C:/College/Digital Image Processing/Images/Original.jpg")
img2
plot(img2)
img1 <- R(img2)
img1
plot(img1)
img1_matR <- as.matrix(img1)
#filt1 <- matrix(c(0,-1,0,-1,4,-1,0,-1,0),3,3)      #Laplacian
filt1 <- matrix(c(-1,-1,-1,-1,8,-1,-1,-1,-1),3,3)  #Laplacian
#filt1 <- matrix(c(-1,0,0,1),2,2)                   #Roberts
#filt1 <- matrix(c(-1,-2,-1,0,0,0,1,2,1),3,3)       #Sobel
div <- length(filt1)
rng <- dim(img1)

calc_mat <- matrix(0,2*(sqrt(length(filt1))-1)+rng[1],2*(sqrt(length(filt1))-1)+rng[2])
new_mat <- calc_mat
skip <- sqrt(length(filt1))-1

for(i in 1:rng[1]){
  for(j in 1:rng[2]){
    calc_mat[i+skip,j+skip] <- img1_matR[i,j]
  }
}

vx <- c()
size <- dim(filt1)
val <- floor(size[1]/2)
val <- -val
for(i in 1:size[1]){
  vx <- append(vx,val,after = length(vx))
  val <- val +1
}
vy <- vx
endd <- dim(new_mat)
endd1 <- endd[1]-floor(size[1]/2)
endd2 <- endd[2]-floor(size[1]/2)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l],j+vy[k]]*filt1[val+vx[l],val+vy[k]]
      }
    }
  }
}
stp <- sqrt(length(filt1))-1
size_nmat <- dim(new_mat)
x <- size_nmat[1]-stp*2
y <- size_nmat[2]-stp*2
fin_mat <- matrix(0,x,y)
for(i in 1:x){
  for(j in 1:y){
    fin_mat[i,j] <- new_mat[i+stp,j+stp]
  }
}
imgR <- as.cimg(fin_mat)
plot(imgR)
imgR_mat <- as.matrix(imgR)

for(i in 1:880){
  for(j in 1:450){
    if(imgR_mat[i,j]> -0.5 && imgR_mat[i,j] < 0.5)
    {
      imgR_mat[i,j] <- 10
    }
  }
}
imgR <- as.cimg(imgR_mat)
plot(imgR)
fadR <- img1+imgR
plot(img1+imgR)

img1 <- G(img2)
img1
plot(img1)
img1_matG <- as.matrix(img1)
#filt1 <- matrix(c(0,-1,0,-1,4,-1,0,-1,0),3,3)      #Laplacian
filt1 <- matrix(c(-1,-1,-1,-1,8,-1,-1,-1,-1),3,3)  #Laplacian
#filt1 <- matrix(c(-1,0,0,1),2,2)                   #Roberts
#filt1 <- matrix(c(-1,-2,-1,0,0,0,1,2,1),3,3)       #Sobel
div <- length(filt1)
rng <- dim(img1)

calc_mat <- matrix(0,2*(sqrt(length(filt1))-1)+rng[1],2*(sqrt(length(filt1))-1)+rng[2])
new_mat <- calc_mat
skip <- sqrt(length(filt1))-1

for(i in 1:rng[1]){
  for(j in 1:rng[2]){
    calc_mat[i+skip,j+skip] <- img1_matG[i,j]
  }
}

vx <- c()
size <- dim(filt1)
val <- floor(size[1]/2)
val <- -val
for(i in 1:size[1]){
  vx <- append(vx,val,after = length(vx))
  val <- val +1
}
vy <- vx
endd <- dim(new_mat)
endd1 <- endd[1]-floor(size[1]/2)
endd2 <- endd[2]-floor(size[1]/2)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l],j+vy[k]]*filt1[val+vx[l],val+vy[k]]
      }
    }
  }
}
stp <- sqrt(length(filt1))-1
size_nmat <- dim(new_mat)
x <- size_nmat[1]-stp*2
y <- size_nmat[2]-stp*2
fin_mat <- matrix(0,x,y)
for(i in 1:x){
  for(j in 1:y){
    fin_mat[i,j] <- new_mat[i+stp,j+stp]
  }
}
imgG <- as.cimg(fin_mat)
plot(imgG)
imgG_mat <- as.matrix(imgG)
for(i in 1:880){
  for(j in 1:450){
    if(imgG_mat[i,j]> -0.5 && imgG_mat[i,j] < 0.5)
    {
      imgG_mat[i,j] <- 4
    }
  }
}
 imgG <- as.cimg(imgG_mat)
plot(imgG)
fadG <- img1+imgG
plot(img1+imgG)

img1 <- B(img2)
img1
plot(img1)
img1_matB <- as.matrix(img1)
#filt1 <- matrix(c(0,-1,0,-1,4,-1,0,-1,0),3,3)      #Laplacian
filt1 <- matrix(c(-1,-1,-1,-1,8,-1,-1,-1,-1),3,3)  #Laplacian
#filt1 <- matrix(c(-1,0,0,1),2,2)                   #Roberts
#filt1 <- matrix(c(-1,-2,-1,0,0,0,1,2,1),3,3)       #Sobel
div <- length(filt1)
rng <- dim(img1)

calc_mat <- matrix(0,2*(sqrt(length(filt1))-1)+rng[1],2*(sqrt(length(filt1))-1)+rng[2])
new_mat <- calc_mat
skip <- sqrt(length(filt1))-1

for(i in 1:rng[1]){
  for(j in 1:rng[2]){
    calc_mat[i+skip,j+skip] <- img1_matB[i,j]
  }
}

vx <- c()
size <- dim(filt1)
val <- floor(size[1]/2)
val <- -val
for(i in 1:size[1]){
  vx <- append(vx,val,after = length(vx))
  val <- val +1
}
vy <- vx
endd <- dim(new_mat)
endd1 <- endd[1]-floor(size[1]/2)
endd2 <- endd[2]-floor(size[1]/2)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l],j+vy[k]]*filt1[val+vx[l],val+vy[k]]
      }
    }
  }
}
stp <- sqrt(length(filt1))-1
size_nmat <- dim(new_mat)
x <- size_nmat[1]-stp*2
y <- size_nmat[2]-stp*2
fin_mat <- matrix(0,x,y)
for(i in 1:x){
  for(j in 1:y){
    fin_mat[i,j] <- new_mat[i+stp,j+stp]
  }
}
imgB <- as.cimg(fin_mat)
plot(imgB)
imgB_mat <- as.matrix(imgB)
for(i in 1:880){
  for(j in 1:450){
    if(imgB_mat[i,j]> -0.5 && imgB_mat[i,j] < 0.5)
    {
      imgB_mat[i,j] <- 10
    }
  }
}
imgB <- as.cimg(imgB_mat)
plot(imgB)
fadB <- img1+imgB
plot(img1+imgB)

par(mfrow=c(1,3))
plot(imgR)#...........................................Image1
plot(imgG)#...........................................Image1
plot(imgB)#...........................................Image1
plot(fadR)#...........................................Image2
plot(fadG)#...........................................Image2
plot(fadB)#...........................................Image2

comb2 <- imlist(fadR/3,fadG,fadB/4)
ccomb2 <- imappend(comb2,"c")
plot(ccomb2)#.........................................Image3

comb2 <- imlist(fadB,fadR,fadG*2)
ccomb2 <- imappend(comb2,"c")
plot(ccomb2)#.........................................Image3

comb2 <- imlist(fadG,fadR/3,fadB/2)
ccomb2 <- imappend(comb2,"c")
plot(ccomb2)#.........................................Image3

