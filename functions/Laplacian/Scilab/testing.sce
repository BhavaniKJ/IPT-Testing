clear all;
clc;
cd /home/lavitha/Scilab-Image-Processing-Toolbox-master
exec builder.sce
exec loader.sce


diary("Read_image.txt")
A_jpeg=imread("color.jpeg")
A_png=imread("color.png")
A_bmp=imread("color.bmp")
A_tif=imread("color.tif")
diary(0)
diary("scilab_laplacian.txt")




//JPEG
B_jpeg_64F=laplacian(A_jpeg, "CV_64F", 5, 5, 1)
B_jpeg_32F=laplacian(A_jpeg, "CV_32F", 5, 5, 1)
B_jpeg_16S=laplacian(A_jpeg, "CV_16S", 5, 5, 1)
B_jpeg_16U=laplacian(A_jpeg, "CV_16U", 5, 5, 1)
B_jpeg_8U=laplacian(A_jpeg, "CV_8U", 5, 5, 1)
//PNG
B_png_64F=laplacian(A_png, "CV_64F", 5, 5, 1)
B_png_32F=laplacian(A_png, "CV_32F", 5, 5, 1)
B_png_16S=laplacian(A_png, "CV_16S", 5, 5, 1)
B_png_16U=laplacian(A_png, "CV_16U", 5, 5, 1)
B_png_8U=laplacian(A_png, "CV_8U", 5, 5, 1)
//bmp
B_bmp_64F=laplacian(A_bmp, "CV_64F", 5, 5, 1)
B_bmp_32F=laplacian(A_bmp, "CV_32F", 5, 5, 1)
B_bmp_16S=laplacian(A_bmp, "CV_16S", 5, 5, 1)
B_bmp_16U=laplacian(A_bmp, "CV_16U", 5, 5, 1)
B_bmp_8U=laplacian(A_bmp, "CV_8U", 5, 5, 1)
//tif
B_tif_64F=laplacian(A_tif, "CV_64F", 5, 5, 1)
B_tif_32F=laplacian(A_tif, "CV_32F", 5, 5, 1)
B_tif_16S=laplacian(A_tif, "CV_16S", 5, 5, 1)
B_tif_16U=laplacian(A_tif, "CV_16U", 5, 5, 1)
B_tif_8U=laplacian(A_tif, "CV_8U", 5, 5, 1)


diary(0)


//jpeg
imshow(B_jpeg_64F)
xs2png(0,'laplacian_jpeg_64F.png')
xs2png(gcf(),'laplacian_jpeg_64F.png')

imshow(B_jpeg_32F)
xs2png(0,'laplacian_jpeg_32F.png')
xs2png(gcf(),'laplacian_jpeg_32F.png')


imshow(B_jpeg_16U)
xs2png(0,'laplacian_jpeg_16U.png')
xs2png(gcf(),'laplacian_jpeg_16U.png')

imshow(B_jpeg_16S)
xs2png(0,'laplacian_jpeg_16S.png')
xs2png(gcf(),'laplacian_jpeg_16S.png')


imshow(B_jpeg_16S)
xs2png(0,'laplacian_jpeg_16S.png')
xs2png(gcf(),'laplacian_jpeg_16S.png')

//imshow(B_png)
//xs2png(0,'laplacian_png.png')
//xs2png(gcf(),'laplacian_png.png')

//png
imshow(B_png_64F)
xs2png(0,'laplacian_png_64F.png')
xs2png(gcf(),'laplacian_png_64F.png')

imshow(B_png_32F)
xs2png(0,'laplacian_png_32F.png')
xs2png(gcf(),'laplacian_png_32F.png')


imshow(B_png_16U)
xs2png(0,'laplacian_png_16U.png')
xs2png(gcf(),'laplacian_png_16U.png')

imshow(B_png_16S)
xs2png(0,'laplacian_png_16S.png')
xs2png(gcf(),'laplacian_png_16S.png')


imshow(B_png_16S)
xs2png(0,'laplacian_png_16S.png')
xs2png(gcf(),'laplacian_png_16S.png')

//bmp
imshow(B_bmp_64F)
xs2png(0,'laplacian_bmp_64F.png')
xs2png(gcf(),'laplacian_bmp_64F.png')

imshow(B_bmp_32F)
xs2png(0,'laplacian_bmp_32F.png')
xs2png(gcf(),'laplacian_bmp_32F.png')


imshow(B_bmp_16U)
xs2png(0,'laplacian_bmp_16U.png')
xs2png(gcf(),'laplacian_bmp_16U.png')

imshow(B_bmp_16S)
xs2png(0,'laplacian_bmp_16S.png')
xs2png(gcf(),'laplacian_bmp_16S.png')


imshow(B_bmp_16S)
xs2png(0,'laplacian_bmp_16S.png')
xs2png(gcf(),'laplacian_bmp_16S.png')

//tif

imshow(B_tif_64F)
xs2png(0,'laplacian_tif_64F.png')
xs2png(gcf(),'laplacian_tif_64F.png')

imshow(B_tif_32F)
xs2png(0,'laplacian_tif_32F.png')
xs2png(gcf(),'laplacian_tif_32F.png')


imshow(B_tif_16U)
xs2png(0,'laplacian_tif_16U.png')
xs2png(gcf(),'laplacian_tif_16U.png')

imshow(B_tif_16S)
xs2png(0,'laplacian_tif_16S.png')
xs2png(gcf(),'laplacian_tif_16S.png')


imshow(B_tif_16S)
xs2png(0,'laplacian_tif_16S.png')
xs2png(gcf(),'laplacian_tif_16S.png')

































































