function [ YUVImg ] = rgb2yuv( RGBImg )
    R = RGBImg(:,:,1);  
    G = RGBImg(:,:,2);  
    B = RGBImg(:,:,3);

    Y0 = 0.256788*R + 0.504129*G + 0.097906*B +  16;
    U0 =-0.148223*R - 0.290993*G + 0.439216*B + 128;
    V0 = 0.439216*R - 0.367788*G - 0.071427*B + 128;
    Y = uint8(min(255,max(0,Y0)));
    U = uint8(min(255,max(0,U0)));
    V = uint8(min(255,max(0,V0)));
    YUVImg(:,:,1) = Y(:,:);
    YUVImg(:,:,2) = U(:,:);
    YUVImg(:,:,3) = V(:,:);
end

