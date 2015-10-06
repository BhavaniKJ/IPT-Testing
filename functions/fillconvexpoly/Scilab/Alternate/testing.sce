clear all;
clc;
cd /home/lavitha/Scilab-Image-Processing-Toolbox-master
//exec builder.sce
//exec loader.sce


diary("Read_image.txt")
A_jpeg=imread("color.jpeg")
A_png=imread("color.png")
A_bmp=imread("color.bmp")
A_tif=imread("color.tif")
diary(0)


diary("scilab_fillconvexpoly.txt")
B_jpeg=fillconvexpoly(A_jpeg, [0 100], 4, 0, 0, 0, 8, 0)
B_png=fillconvexpoly(A_png, [0 100], 4, 0, 0, 0, 8, 0)
B_bmp=fillconvexpoly(A_bmp, [0 100], 4, 0, 0, 0, 8, 0)
B_tif=fillconvexpoly(A_tif, [0 100], 4, 0, 0, 0, 8, 0)
diary(0)


imshow(B_jpeg)
xs2png(0,'Scilab_jpeg_fillconvexpoly.png')
xs2png(gcf(),'Scilab_jpeg_fillconvexpoly.png')
imshow(B_png)
xs2png(0,'Scilab_png_fillconvexpoly.png')
xs2png(gcf(),'Scilab_png_fillconvexpoly.png')
imshow(B_bmp)
xs2png(0,'Scilab_bmp_fillconvexpoly.png')
xs2png(gcf(),'Scilab_bmp_fillconvexpoly.png')
imshow(B_tif)
xs2png(0,'Scilab_tif_fillconvexpoly.png')
xs2png(gcf(),'Scilab_tif_fillconvexpoly.png')
























































