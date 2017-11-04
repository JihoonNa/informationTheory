function [ returnImg ] = changeIntensityLevel( img, level )
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치
imgSize = size(img);
level = double(256/level);
img = double(img);
returnImg = zeros(imgSize(1),imgSize(2),imgSize(3));

for i=1:imgSize(1)
    for j=1:imgSize(2)
        for k = 1:imgSize(3)
            returnImg(i,j,k) = floor(img(i,j,k)/level)+1;
        end
    end
end
%returnImg = uint8(returnImg);
end

