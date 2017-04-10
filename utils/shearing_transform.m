
function [xt,yt,mat] = shearing_transform(x,y,s,axis)
mat = eye(3);
if axis=='x'
   mat(2,1)= s;
else
    mat(1,2)=s;
end
XY = [x;y;ones(1,size(x,2))];
XYt = mat*XY;
xt = XYt(1,:);
yt = XYt(2,:);
end