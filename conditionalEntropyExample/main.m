clear all; close all; clc;
 
path = 'C:\Users\home\Documents\MATLAB\hw2img\';
d = dir(strcat(path,'*.jpg'));
level = 32;

Y_Table = zeros(level,3);
X_Entropy = zeros(3,1);
X_Y_JointEntropy = zeros(3,1);
Y_X_ConditionalEntropy = zeros(3,1);
intensityMat = zeros(level,level,3,3);
        
R_CorrMat = [];
G_CorrMat = [];
B_CorrMat = [];
Y_CorrMat = [];


for i=1:length(d)
    
    
    RGBImg = imread(strcat(path,d(i).name));
    YUVImg = rgb2yuv( RGBImg );
    
    RGB32LevelImg = changeIntensityLevel(RGBImg,level);
    YUV32LevelImg = changeIntensityLevel(YUVImg,level);
    
    RImg = RGB32LevelImg(:,:,1);
    GImg = RGB32LevelImg(:,:,2);
    BImg = RGB32LevelImg(:,:,3);
    YImg = YUV32LevelImg(:,:,1);
    
    
    R_CorrMat = [R_CorrMat,RImg(:)];
    G_CorrMat = [G_CorrMat,GImg(:)];
    B_CorrMat = [B_CorrMat,BImg(:)];
    Y_CorrMat = [Y_CorrMat,YImg(:)];
    
    imageSize = size(RGB32LevelImg);
    
    
     for color = 1:3
         for yuvAxis = 1:3
            for i = 1:imageSize(1)
                for j = 1:imageSize(2)
                    intensityMat(RGB32LevelImg(i,j,color),YUV32LevelImg(i,j,yuvAxis),color,yuvAxis) = intensityMat(RGB32LevelImg(i,j,color),YUV32LevelImg(i,j,yuvAxis),color,yuvAxis) + 1;
                end
            end
         end
     end
end

 for color = 1:3    
     Table_X_Y = intensityMat(:,:,color,1);

     tableSum = double(sum(sum(Table_X_Y)));
     tableSize = size(Table_X_Y);

     Y_X_ConditionalEntropy(color) = 0.0;
     X_Y_JointEntropy(color) = 0.0;

     for X_i = 1 : tableSize(1)
         for Y_j = 1: tableSize(2)
            P_XY = Table_X_Y(X_i,Y_j)/tableSum;
            if (P_XY~=0)
                X_Y_JointEntropy(color) = X_Y_JointEntropy(color) + P_XY*log2(1.0/P_XY);
            end
        end
     end

     X_Table = sum(Table_X_Y,2);
     Y_Table(:,color) = sum(Table_X_Y,1);

     X_Entropy(color) = calEntropy(X_Table);
     Y_X_ConditionalEntropy(color) = X_Y_JointEntropy(color) - X_Entropy(color) ;
 end
 Y_Entropy = calEntropy(sum(Y_Table,2));
 
 correlation_R_Y = corrcoef(R_CorrMat,Y_CorrMat);
 correlation_G_Y = corrcoef(G_CorrMat,Y_CorrMat);
 correlation_B_Y = corrcoef(B_CorrMat,Y_CorrMat);


