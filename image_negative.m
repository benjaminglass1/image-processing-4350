function out = image_negative(in)

%in = imread('ImMammogramGS.tif');
%in=imread('ImgSkeleton.jpg');

b = in;
bd = double(b);
[m,n] = size(bd);

L=256;
out=bd;

for i = 1:m
    for j = 1:n
        out(i,j) = L-1-out(i,j);        
    end
end

out=uint8(out);

figure;
subplot(2,2,1);
imshow(in);
subplot(2,2,2);
imshow(out);
