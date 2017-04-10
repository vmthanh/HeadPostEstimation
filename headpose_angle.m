function [t1,t2,t3] = headpose_angle(P)
    t1 = atand(P(3,2)/P(3,3))
    t2 = atand(P(3,1)/sqrt(P(3,2)^2 + P(3,3)^2)) 
    t3 = atand(P(2,1)/P(1,1))
end