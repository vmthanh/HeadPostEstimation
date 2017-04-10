function [] = draw_surface(P,x) 
%Draw surface with know 3 point P1, P2, P3

% 
% %Draw 3D point first
figure
P1 = [P(1,1),P(1,2),P(1,3)]
P2 = [P(2,1),P(2,2),P(2,3)]
P3 = [P(3,1),P(3,2),P(3,3)]
fill3(P1', P2', P3','green'), hold on

% % %Draw 2D point later
x1 = [x(1,1),x(1,2),x(1,3)]
x2 = [x(2,1),x(2,2),x(2,3)]
x3 = [x(3,1),x(3,2),x(3,3)]
fill3(x1, x2, x3,'red'), hold on 


