function [p] = penalty_function(k0,kn,Z)
    k = (k0-kn).^2;
    p = dot(k,(Z.^2));
   
end