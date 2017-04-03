function [A_N] = normalization(A)
mean_a = mean(A,2);%mean by row 
A_N = A - mean_a;
A_N = A_N ./ pdist2(A',mean_a')'; %calculate the distance 
end