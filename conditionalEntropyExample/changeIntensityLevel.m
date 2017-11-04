function [ returnImg ] = changeIntensityLevel( img, level )
%UNTITLED2 �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
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

