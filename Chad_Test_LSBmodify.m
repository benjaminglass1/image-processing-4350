function [] = Chad_Test_LSBmodify()
%LSBMODIFY (Least Significant Bit Modify)
%   Intended for Img1GS

%imagefile = 'Img1GS.tif';
%imgType = 'tif';

clf

OriginalImage = imread('Img1GS.tif','tif');

%OriginalImage = im2double(OriginalImage);

ImgLen = length(OriginalImage(:,1,1));
ImgWid = length(OriginalImage(1,:,1));

%BitCount = 8;
%BitSize = 2^BitCount;

%LayerWidth = 1/8;
LSBsub = bin2dec('11111110');
LSBcum = bin2dec('00000001');
M1sub =  bin2dec('11111100');
M1cum = bin2dec('00000011');
M2sub =  bin2dec('11111000');
M2cum = bin2dec('00000111');
M3sub =  bin2dec('11110000');
M3cum = bin2dec('00001111');
M4sub =  bin2dec('11100000');
M4cum = bin2dec('00011111');
M5sub =  bin2dec('11000000');
M5cum = bin2dec('00111111');
M6sub =  bin2dec('10000000');
M6cum = bin2dec('01111111');
MSBsub = bin2dec('00000000');
MSBcum = bin2dec('11111111');


for p = 1:2 %% 1:16 for 130 total figures

    MiddleImage = OriginalImage;
    RightImage = MiddleImage;
    
    switch p
        case 1
            bitMask = LSBsub;
            bitMark = "LSB subtracted:";
        case 2
            bitMask = LSBcum;
            bitMark = "LSB included:";
        case 3
            bitMask = M1sub;
            bitMark = "Bit 1 subtracted:";
        case 4
            bitMask = M1cum;
            bitMark = "Bit 1 included:";
        case 5
            bitMask = M2sub;
            bitMark = "Bit 2 subtracted:";
        case 6
            bitMask = M2cum;
            bitMark = "Bit 2 included:";
        case 7
            bitMask = M3sub;
            bitMark = "Bit 3 subtracted:";
        case 8
            bitMask = M3cum;
            bitMark = "Bit 3 included:";
        case 9
            bitMask = M4sub;
            bitMark = "Bit 4 subtracted:";
        case 10
            bitMask = M4cum;
            bitMark = "Bit 4 included:";
        case 11
            bitMask = M5sub;
            bitMark = "Bit 5 subtracted:";
        case 12
            bitMask = M5cum;
            bitMark = "Bit 5 included:";
        case 13
            bitMask = M6sub;
            bitMark = "Bit 6 subtracted:";
        case 14
            bitMask = M6cum;
            bitMark = "Bit 6 included:";
        case 15
            bitMask = MSBsub;
            bitMark = "MSB subtracted:";
        otherwise
            bitMask = MSBcum;
            bitMark = "MSB included:";
    end
    
    for k = 1:ImgLen
        for l = 1:ImgWid
            MiddleImage(k,l,1) = bitand(OriginalImage(k,l,1),bitMask,'uint8');
        end
    end

    
    for q = 1:2 %% 1:5 for full range
        
        PrintCount = bitMark;


        for k = 1:ImgLen
            for l = 1:ImgWid
                switch q
                    case 1

                        RightImage(k,l,1) = OriginalImage(k,l,1) - MiddleImage(k,l,1);
                        RightImage(k,l,1) =  im2double(RightImage(k,l,1));
                        RightImage(k,l,1) =  255*(1-RightImage(k,l,1));
                        RightImage(k,l,1) =  uint8(RightImage(k,l,1));
                        titleSelect = PrintCount + " Uint8 <= Inverse(Double(Orig - Mid))";
                        titleSelect2 = "Image Demonstrating Effect of LSB";
                    case 2
                        RightImage(k,l,1) = (OriginalImage(k,l,1)-((OriginalImage(k,l,1) - MiddleImage(k,l,1))));
                        RightImage(k,l,1) =  RightImage(k,l,1);
                        titleSelect = PrintCount +" Orig - (Orig - Mid)";
                        titleSelect2 = "Image Deducted by Given Image Removed of LSB";
                    case 3
                        RightImage(k,l,1) = (OriginalImage(k,l,1) - MiddleImage(k,l,1));
                        im2double(OriginalImage);
                        im2double(RightImage);
                        RightImage(k,l,1) =  1-RightImage(k,l,1);
                        titleSelect = PrintCount + " Inverse(Orig - Mid)";
                    case 4
                        RightImage(k,l,1) = (OriginalImage(k,l,1)-((OriginalImage(k,l,1) - MiddleImage(k,l,1))));
                        im2double(OriginalImage);
                        im2double(RightImage);
                        RightImage(k,l,1) =  1-RightImage(k,l,1);
                        titleSelect = PrintCount + " Inverse(Orig - (Orig - Mid))";
                        
                    otherwise
                        RightImage(k,l,1) = (OriginalImage(k,l,1) - MiddleImage(k,l,1));
                        RightImage(k,l,1) =  RightImage(k,l,1);
                        titleSelect = PrintCount + " Orig - Mid";

                        
                end
            end
        end
        
        figure(p*8+q-1)
        subplot(1,3,1)
        imshow(OriginalImage)
        subplot(1,3,2)
        imshow(MiddleImage)
        title(titleSelect)
        subplot(1,3,3)
        imshow(RightImage)
        xlabel(titleSelect2)
    end
end
%%%% FIGURES 9 & 16 are ideal images
%
%   Figure 16 displays the locality of wheree darkening occurs
%               due to the inversion of the image
%
%   Figure 9 is the requested image.  Figure 16 supports
%               that it is the correct results.
%
%%%%


end

