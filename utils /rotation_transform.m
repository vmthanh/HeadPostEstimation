function [xt,yt,mat] = rotation_transform(x,y,ang)
mat=[cos(ang) -sin(ang);sin(ang) cos(ang)];
mat = [mat,zeros(2,1)]
mat = [mat;[0,0,1]]
XY = [x;y;ones(1,size(x,2))];
XYt = mat*XY;
xt = XYt(1,:)
yt = XYt(2,:)
end