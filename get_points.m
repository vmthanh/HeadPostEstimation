function [P,mat,s,x] = get_points(O,l,w,h)
%Code for get 3 points in specific way 
x = [O(1),O(1)+l,O(1)+ l/2]; 
y = [O(2),O(2),O(2)-w/2]; 
z = [O(3),O(3),O(3)+h]; 
P = [x;y;z];

mat = rand(2,4)
mat = [mat;[zeros(1,3),1]]
P = [P;ones(1,3)]
s = 2
x = s*mat*P