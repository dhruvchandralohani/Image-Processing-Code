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
for(i in ceiling(size[1]/2):endd1){
  for(j in ceiling(size[1]/2):endd2){
    for(k in 1:size[1]){
      for(l in 1:size[1]){
        if(calc_mat[i+vx[l]+1,j+vy[k]+1] == struc_ele[val+vx[l],val+vy[k]]){#Checking if filter's f(x+s,y+t) is equal
          new_mat[i,j] <- 1L                                                #to the image's w(x+s,y+t) for every x,y
        }                                                                   #where s is from -a to a and t is from
        else{                                                               # -b to b.
          new_mat[i,j] <- 0L                                                #If the filter matches completely, it is a
          break                                                             #HIT otherwise a MISS.
        }
      }
    }
  }
}
plot(as.cimg(new_mat))