function [xt,yt,mat] = translation_transform(x,y,tx,ty)
mat = eye(3)
mat(1,3) = tx;
mat(2,3) = ty;
XY = [x;y;ones(1,size(x,2))];
XYt = mat*XY;
xt = XYt(1,:)
yt = XYt(2,:)
end