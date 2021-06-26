library(imager)
img1 <- load.image("/home/dhruv/Desktop/Original_Image(Hit_or_Miss_Transform).png")
img1 <- grayscale(img1)
wid <- width(img1)
hei <- height(img1)
mat <- as.matrix(img1)
img1_mat <- matrix(0,wid,hei)
#Loop to convert grayscale image into black and white image(Original Image)
for(i in 1:wid){
  for(j in 1:hei){
    if(mat[i,j] > 0.5){
      img1_mat[i,j] <- 1L
    }
    else{
      img1_mat[i,j] <- 0L
    }
  }
}
plot(as.cimg(img1_mat))
struc_ele <- matrix(c(1,0,1,0,0,0,1,0,1),3,3)     #Structuring Element
# print("Enter values(0|1):") #FOR USER INPUT
# for (i in 1:3) {
#   for (j in 1:3) {
#     struc_ele[i,j] = as.integer(readline("Enter element:-"))
#   }
# }

x <- 0L
#This loop will check how many foreground elements are present in the SE
for(i in 1:nrow(struc_ele)){
  for(j in 1:ncol(struc_ele)){
    if(struc_ele[i,j] == 1){
      x <- x+1
    }
  }
}
calc_mat <- matrix(0,wid+2,hei+2)
new_mat <- calc_mat
new_mat <- matrix(0,wid,hei)
for(i in 1:wid){
  for(j in 1:hei){
    calc_mat[i+1,j+1] <- img1_mat[i,j]
  }
}
vx <- c()
size <- dim(struc_ele)
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
#This loop is performing correlation
#Erosion(Image,SE)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l]+1,j+vy[k]+1]*struc_ele[val+vx[l],val+vy[k]]
      }
    }
    if(new_mat[i,j] == x){    #If the result of correlation is equal to the value of x i.e. total 1's in SE
      new_mat[i,j] <- 1L      #then it is assigned foreground value(white)
    }
    else{                     #otherwise
      new_mat[i,j] <- 0L      #it is assigned background value(black)
    }
  }
}
plot(as.cimg(new_mat))

#Erosion of complemented image and SE
cimg1_mat <- 1-img1_mat
cstruc_ele <-1-struc_ele
plot(as.cimg(cimg1_mat))
y <- 0L
#This loop will check how many foreground elements are present in the SE
for(i in 1:nrow(cstruc_ele)){
  for(j in 1:ncol(cstruc_ele)){
    if(cstruc_ele[i,j] == 1){
      y <- y+1
    }
  }
}
calc_mat2 <- matrix(0,wid+2,hei+2)
new_mat2 <- calc_mat2
new_mat2 <- matrix(0,wid,hei)
for(i in 1:wid){
  for(j in 1:hei){
    calc_mat2[i+1,j+1] <- cimg1_mat[i,j]
  }
}
vx <- c()
size <- dim(cstruc_ele)
val <- floor(size[1]/2)
val <- -val
for(i in 1:size[1]){
  vx <- append(vx,val,after = length(vx))
  val <- val +1
}
vy <- vx
endd <- dim(new_mat2)
endd1 <- endd[1]-floor(size[1]/2)
endd2 <- endd[2]-floor(size[1]/2)
#This loop is performing correlation
#Erosion(complemented image,complemented SE)
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat2[i,j] <- new_mat2[i,j] + calc_mat2[i+vx[l]+1,j+vy[k]+1]*cstruc_ele[val+vx[l],val+vy[k]]
      }
    }
    if(new_mat2[i,j] == y){    #If the result of correlation is equal to the value of x i.e. total 1's in SE
      new_mat2[i,j] <- 1L      #then it is assigned foreground value(white)
    }
    else{                     #otherwise
      new_mat2[i,j] <- 0L      #it is assigned background value(black)
    }
  }
}
plot(as.cimg(new_mat2))
#Loop for Intersection
fin_mat <- matrix(0,wid,hei)
for(i in 1:wid){
  for(j in 1:hei){
    if((new_mat[i,j] == 1 && new_mat2[i,j] == 1) || (new_mat[i,j] == 0 && new_mat2[i,j] == 0) )
      fin_mat[i,j] <- 1L
    else
      fin_mat[i,j] <- 0L
  }
}
plot(as.cimg(fin_mat))
