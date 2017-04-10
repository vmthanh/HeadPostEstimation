function [e] = feature_disparity(b,a)
    d = b - a;
    e = sum(sum(d.^2));
end