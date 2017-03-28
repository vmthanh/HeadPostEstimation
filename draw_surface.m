function [R] = draw_surface(P,x,l,w,h) 
%Draw surface with know 3 point P1, P2, P3
%l is the length of the box in the x-direction, 
% w is the width of the box in the y-direction, and h is the height of the 
% box in the z-direction. The functin will draw a surface 

%Code for get 3 points in specific way 
% x = [P(1),P(1)+l,P(1)+ l/2]; 
% y = [P(2),P(2),P(2)-w/2]; 
% z = [P(3),P(3),P(3)+h]; 
% R = [x;y;z];

% mat = rand(2,4)
% [mat;[zeros(1,3),1]]
% P = [P;ones(1,3)]
%  x = s*mat*P

figure
%Draw 3D point first
% P1 = [P(1,1),P(2,1),P(3,1)]
% P2 = [P(1,2),P(2,2),P(3,2)]
% P3 = [P(1,3),P(2,3),P(3,3)]
% fill3(P1, P2, P3,'green'), hold on


%Draw 2D point later
x1 = [x(1,1),x(2,1)]
x2 = [x(1,2),x(2,2)]
x3 = [x(1,3),x(2,3)]
fill(x1, x2, x3,'red'), hold on 


