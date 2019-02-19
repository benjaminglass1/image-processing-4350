function [img1,img2,img3] = power_law_transformation(in,gamma1,gamma2,gamma3)

%in = imread('ImAerialGS.tif');
%gamma = 3.0,4.0,5.0;

b = in;

bd = double(b);

c = 1;
img1 = abs((c*bd).^gamma1);
img2 = abs((c*bd).^gamma2);
img3 = abs((c*bd).^gamma3);

maxm1 = max(img1(:));
minm1 = min(img1(:));
maxm2 = max(img2(:));
minm2 = min(img2(:));
maxm3 = max(img3(:));
minm3 = min(img3(:));

K = 255;

img1 = (K*img1) / (maxm1-minm1);  
img2 = (K*img2) / (maxm2-minm2);  
img3 = (K*img3) / (maxm3-minm3); 

img1 = uint8(img1);
img2 = uint8(img2);
img3 = uint8(img3);

figure;
subplot(2,2,1);
imshow(in);
title('Original Image');
subplot(2,2,2);
imshow(img1);
title('Gamma=3.0');
subplot(2,2,3);
imshow(img2);
title('Gamma=4.0');
subplot(2,2,4);
imshow(img3);
title('Gamma=5.0');

