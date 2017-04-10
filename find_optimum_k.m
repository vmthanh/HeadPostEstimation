function [k,cost] = find_optimum_k(b,a)
    cost=[];
    precision = 0.0001;
    c = 0.001;
    k = ones(1,size(b,2))';
    a(3,:) = a(3,:).*k';
    old_cost = 0;
    cur_cost = feature_disparity(b,a);
    cost =[cost,cur_cost];
    res = abs(cur_cost-old_cost);
   
    while(res>= precision*norm(gradient_vector(b,a,k)))
        old_cost = cur_cost;
        k = k-c.*gradient_vector(b,a,k);
        cur_cost = cost_function(b,a,k);
        res = abs(cur_cost-old_cost);
        cost = [cost,cur_cost];
      
    end
    figure 
    hold on 
    plot(cost)
    title('Trend of feature disparity')
    xlabel('Iteration (n)')
    ylabel('Feature disparity(e)')
end

function [e] = cost_function(b,a,kn)
    alpha = 0.01;
    k0 = ones(1,size(b,2))';
    a(3,:) = a(3,:).*kn';
    
    e0 = feature_disparity(b,a);
    p = alpha*penalty_function(k0,kn,a(3,:));
    e = e0 + p;
end

function [vector] = gradient_vector(b,a,k)
    vector = zeros(1,size(k,1))';
    delta = 0.01;
    for i=1:size(vector,1)
        k_temp1 = k;
        k_temp2 = k;
        
        k_temp1(i,1) = k_temp1(i,1) + delta;
        k_temp2(i,1) = k_temp2(i,1) - delta;
        
        e1 = cost_function(b,a,k_temp1);
        e2 = cost_function(b,a,k_temp2);
        vector(i,1) = (e1-e2)/(2*delta);
    end
end
