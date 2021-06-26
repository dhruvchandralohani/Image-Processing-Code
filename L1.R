
library(magick)
library(imager)

#using magick
img1 <- image_read("/home/dhruv/Desktop/samp.jpg") 
img1

#using imager
img2 <- load.image("/home/dhruv/Desktop/samp.jpg")
img2
plot(img2)

#NOTE: magick package returns a magick image object, imager returns a cimg.

#changing to grayscale
img1gray <- image_convert(img1, type = "grayscale")
plot(img1gray)
#changing to black and white
img1BW <- image_convert(img1, type = "BiLevel")
img1BW
plot(img1BW)
#changing format/writing new image to a specified folder
#image_write(img1BW, path = "/home/sakeena_shahid/Desktop/R_documentation/test.png", format = "png")

#converting to grayscale using imager
img2gray <- grayscale(img2)
img2gray

#seperating color channels using IMAGER. WAY ONE
colorim <- load.image("/home/dhruv/Desktop/samp.jpg")
plot(colorim)
Lsplit <- imsplit(colorim, "c") #returns an imlist
plot(Lsplit)
#combining the channels back together
Lappend <- imappend(Lsplit, "c") #returns cimg

#WAY TWO
Rchannel <- R(colorim) #this is cimg
plot(Rchannel)
Gchannel <- G(colorim)
plot(Gchannel)
Bchannel <- B(colorim)
plot(Bchannel)
#combing to create an imlist which imappend accepts
combined <- imlist(Rchannel, Gchannel, Bchannel) 
colorCombined <- imappend(combined, "c")
plot(colorCombined)

#gives several plots in the same window
par(mfrow=c(2,2)) #matrix filed by row
plot(colorim)
plot(Rchannel)
plot(Gchannel)
plot(Bchannel)

#to resize image using imager
resized1 <- resize_doubleXY(img2gray) #to resize the image to double its original size, return a new cimg
plot(resized1)
resize_halfXY(img2gray) #halving the image. P.S. a new variable should be created for storing
resize_tripleXY(img2gray)
resized2 <-resize(img2gray, size_x=200, size_y = 300) #providing pixel dimensions manually.
plot(resized2)

#to crop using magick
cropped <- image_crop(img1, "250x250+100+100") #this does not effect the original image
plot(cropped) 

#to flip
#using magick
flipped1 <- image_flip(img1)
plot(flipped)

#using imager
flipped2 <- mirror(img2, "x")
plot(flipped2)

#to flop
#using magick
flopped <- image_flop(img1)
plot(flopped)

#using imager
flopped2 <- mirror(img2, "y")
plot(flopped2)

#to negate(invert the colors)
negate <- mirror(colorim, "c")
plot(negate)

#matrix representation of images
#loading a binary image for simplicity
testing <- load.image("/home/dhruv/Desktop/samp.jpg")

dim(testing) #to see dimensions, other ways have been explained above
plot(testing)
#to find the  pixel value at coordinates specified
color.at(testing, x= 500, y=400)
#converting to matrix
#NOTE: array/matrix indexing starts at 1 in R. 
matrix_rep <- as.matrix(testing)
matrix_rep[500,400] #will be equal to 1 because image is read in scanline order ie. width first
#this is the what we study in class; can be done, can be ignored. 
  matrix_rep <- t(matrix_rep) 

#flipping the image along the 3 axes(x,y,c) without in-built functions...
#DO IT YOURSELF
#HINT: create an empty canvas to store the new image.   