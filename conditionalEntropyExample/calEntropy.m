function [ val ] = calEntropy( mat )
mat = mat';
matSum = sum(mat);
mat = mat/matSum;
val = sum(mat(mat~=0).*log2(mat(mat~=0)));
val = -val;
end

