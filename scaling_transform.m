function [xt,yt,mat] = scaling_transform(x,y,sx,sy)
mat = eye(3)
mat(1,1) = sx;
mat(2,2) = sy;
XY = [x;y;ones(1,size(x,2))];
XYt = mat*XY;
xt = XYt(1,:)
yt = XYt(2,:)
end