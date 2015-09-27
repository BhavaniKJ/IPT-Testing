diary('Matlab_imgaussfilt.txt')
G = fspecial('gaussian',[10 10],10);
B_jpeg = imfilter(A_jpeg,G,'replicate')
B_png = imfilter(A_png,G,'replicate')
B_bmp = imfilter(A_bmp,G,'replicate')
B_tif = imfilter(A_tif,G,'replicate')
diary off

subplot(4,2,1)
imshow(A_jpeg)
title('Jpeg Image');
subplot(4,2,2)
imshow(B_jpeg)
title('Gaussian filt img');

subplot(4,2,3)
imshow(A_png)
title('PNG Image');
subplot(4,2,4)
imshow(B_png)
title('Gaussian filt img');

subplot(4,2,5)
imshow(A_bmp)
title('BMP Image');
subplot(4,2,6)
imshow(B_bmp)
title('Gaussian filt img');

subplot(4,2,7)
imshow(A_tif(:,:,(1:3)))
title('TIFF Image');
subplot(4,2,8)
imshow(B_tif(:,:,(1:3)))
title('Gaussian filt img');

