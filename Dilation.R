library(imager)
img1 <- load.image("/home/dhruv/Desktop/Original_Image(Erosion_&_Dilation).png")
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

struc_ele <- matrix(c(0,1,0,1,1,1,0,1,0),3,3)     #Structuring Element
# print("Enter values(0|1):") #FOR USER INPUT
# for (i in 1:3) {
#   for (j in 1:3) {
#     struc_ele[i,j] = as.integer(readline("Enter element:-"))
#   }
# }
calc_mat <- matrix(0,wid+2,hei+2)
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
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        new_mat[i,j] <- new_mat[i,j] + calc_mat[i+vx[l]+1,j+vy[k]+1]*struc_ele[val+vx[l],val+vy[k]]
      }
    }
    if(new_mat[i,j] > 0){    #If the result of correlation is greater than 0(i,e. one SE matched)
      new_mat[i,j] <- 1L      #then it is assigned foreground value(white)
    }
    else{                     #otherwise
      new_mat[i,j] <- 0L      #it is assigned background value(black)
    }
  }
}
plot(as.cimg(new_mat))

#Using dilate() function for Dilation
img2 <- as.cimg(struc_ele)
plot(dilate(img1,img2))