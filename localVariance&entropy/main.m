clear all; close all; clc;figure;
 
 
colorImgLenna = imread('Lenna.png');
grayImgLenna = rgb2gray(colorImgLenna);
entropyLenna = entropy(grayImgLenna);
doubleImgLenna = double(grayImgLenna);
imgLennaVariance = var(doubleImgLenna(:));
subplot(1,2,1);
imshow(grayImgLenna);
title(entropyLenna);
figure;
histogram(grayImgLenna);
 
 
 
colorImgBaboon = imread('Baboon.jpg');
grayImgBaboon = rgb2gray(colorImgBaboon);
entropyBaboon = entropy(grayImgBaboon);
doubleImgBaboon = double(grayImgBaboon);
imgBaboonVariance = var(doubleImgBaboon(:));
subplot(1,2,2)
imshow(grayImgBaboon);
title(entropyBaboon);
figure;
histogram(grayImgBaboon);
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
img = grayImgBaboon;
maskSize = 32;
corrMat = zeros((length(img)/maskSize)^2,2);
 set(gca, 'YScale', 'log')
for i=1:length(img)/maskSize
    for j=1:length(img)/maskSize
        mask = img((i-1)*maskSize+1:i*maskSize,(j-1)*maskSize+1:j*maskSize);
        corrMat((i-1)*(length(img)/maskSize)+j,1) = entropy(mask);
        corrMat((i-1)*(length(img)/maskSize)+j,2) = var(double(mask(:)));
        if((i-1)*(length(img)/maskSize)+j==237)
            imshow(mask)
            aa=mask
        end
        %hold on;
        %plot(corrMat((i-1)*(length(img)/maskSize)+j,1),corrMat((i-1)*(length(img)/maskSize)+j,2),'b*');
    end
end
pearson = corrcoef(corrMat(:,1),corrMat(:,2));
