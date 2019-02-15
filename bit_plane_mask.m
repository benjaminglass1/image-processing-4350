function out = bit_plane_mask(in,n1)

%a=imread('aster_dc_lrg.jpg');
%n1=1; % bit number removed

a=in;
[m,n]=size(a);

s=255-(2^(n1-1));
for i=1:m;
    for j=1:n;
        b(i,j)=bitand(a(i,j),s);
    end
end
c=uint8(b);
d=imsubtract(double(a),double(c));
figure; montage({a,c,d}),colorbar;


