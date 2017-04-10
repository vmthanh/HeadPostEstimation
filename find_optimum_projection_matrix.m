function [P] = find_optimum_projection_matrix(b,a,k)
     a(3,:) = a(3,:).*k';
     r1r2 = b*a'*inv(a*a');
     r3 = cross(r1r2(1,:),r1r2(2,:))
     P = [r1r2(1,:);r1r2(2,:);r3]
end