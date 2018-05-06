function [labels] = KNNclassify(Model,datas)
labels = [];
for i = 1 : size(datas,1)
    dist = pdist2(datas(i,:),Model.datas);
    [~,idx] = sort(dist,'ascend');
    
    labels = [labels;mode(Model.labels(idx(1:Model.k)))];
end
end

