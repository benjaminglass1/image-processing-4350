function [img1,img2,img3] = power_law_transformation(in,gamma1,gamma2,gamma3)

%in = imread('ImAerialGS.tif');
%gamma = 3.0,4.0,5.0;

b = in;

bd = double(b);
[m,n] = size(bd);

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

for i = 1:m
    for j = 1:n
        img1(i,j) = (K*img1(i,j)) / (maxm1-minm1);  
        img2(i,j) = (K*img2(i,j)) / (maxm2-minm2);  
        img3(i,j) = (K*img3(i,j)) / (maxm3-minm3); 
    end
end


img1 = uint8(img1);
img2 = uint8(img2);
img3 = uint8(img3);

figure;
subplot(2,2,1);
imshow(in);
subplot(2,2,2);
imshow(img1);
subplot(2,2,3);
imshow(img2);
subplot(2,2,4);
imshow(img3);

