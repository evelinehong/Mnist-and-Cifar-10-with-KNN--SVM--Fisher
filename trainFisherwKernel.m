function Model = trainFisherwKernel(data,label,kernel,epsilon)
    if nargin < 4
        epsilon = 0.001;    
    end
    
    data = double(data);
    l = size(data,1);
    c = max(label)-min(label)+1;
    kmatrix = kernel(data,data);
    Ms = sum(kmatrix,2) ./ l;
    M = zeros(size(Ms,1),size(Ms,1));
    N = zeros(size(M));
    for i = min(label) : max(label)
    	ki = kmatrix(:,label == i);
    	li = size(ki,2);
    	Mi = sum(ki,2);
    	M = M + (Mi-Ms) * (Mi-Ms)';
    	N = N + ki * (eye(li)-ones(li)./li) * ki';
    end
    N = N + epsilon*eye(size(N));
    [V,D] = eig(N\M);
    [~,idx] = sort(diag(D),'descend');
    Model.center = [];
    Model.alpha = V(:,idx(1:c-1));
    Model.traindata = data;

    for i = min(label) : max(label)
    	ki = kmatrix(label == i,:);
    	cc = ki * Model.alpha;
    	cc = mean(cc);
        Model.center = [Model.center;cc];
    end

end



