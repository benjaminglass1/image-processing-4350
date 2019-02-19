function out = image_negative(in)

%in = imread('ImMammogramGS.tif');

out = double(in);
L=256;
out = L-1-out;    
out=uint8(out);

figure;
subplot(2,2,1);
imshow(in);
title('Digital Mammogram');
subplot(2,2,2);
imshow(out);
title('Negative Image');
