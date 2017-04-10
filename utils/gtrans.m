function [At,mat] = gtrans(A,type,tx,ty,ang)
%GTRANS      For use with gtrans which
%            is used for doing affine transformation in images and show 
%            the result.
%            
%INPUT:           A     = image matrix   
%                 type  = type of transform, each type will have different
%                 paramerters for tx, ty, ang
%                   1:  translattion transform
%                       tx: specifies the displacement along the x axis
%                       ty: specifies the displacement along the y axis.
%                   2: scale transform
%                       tx: specifies the scale factor along the x axis
%                       ty: specifies the scale factor along the y axis.
%                   3: shear transform
%                       tx: specifies the shear factor along the x axis
%                       ty: specifies the shear factor along the y axis.
%                   4: rotation transform
%                       ang: specifies the angle of rotation in degrees 
%OUTPUT
%                 At    = transformed image matrix
%                 mat   = transformed matrix (3x3)
%
%        Use in the form ==>[At,mat]= gtrans(A,1,30,20,0)  <==
%        Explain: translate image x to x a

%Get the property of image
A_ref = imref2d(size(A));
%create identity matrix 3x3
mat = eye(3);
if type ==1
    mat(3,1) = tx;
    mat(3,2) = ty;
    % align the coordiate of transformed image to be same as 
    % the orginal image
    At_ref = A_ref;
    At_ref.XWorldLimits(2) = A_ref.XWorldLimits(2) ;
    At_ref.YWorldLimits(2)  = A_ref.YWorldLimits(2);

    tform = affine2d(mat);
    [At,At_ref]= imwarp(A,tform,'OutputView',At_ref);
elseif type == 2
    mat(1,1) = tx;
    mat(2,2) = ty;
  
    tform = affine2d(mat);
    [At,At_ref]= imwarp(A,tform);
elseif type == 3
    mat(1,2) = tx;
    mat(2,1) = ty;
    
    tform = affine2d(mat);
    [At,At_ref]= imwarp(A,tform);
elseif type == 4
    radian = ang*pi/180;
    mat=[cos(radian) sin(radian);-sin(radian) cos(radian)];
    mat = [mat,zeros(2,1)];
    mat = [mat;[0,0,1]];
    
    tform = affine2d(mat);
    [At,At_ref]= imwarp(A,tform);
else
    error('Input wrong parameters. See help: help gtrans');
end

%show figure
figure; 
subplot(1,2,1);
imshow(A,A_ref);
title('Original image')

subplot(1,2,2);
imshow(At,At_ref);
title('Transformed image')

end