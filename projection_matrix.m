function [P] = projection_matrix(B,A)
    P = B*A'*inv(A*A')
    r3 = cross(P(1,:),P(2,:))
    P = [P;r3]
end