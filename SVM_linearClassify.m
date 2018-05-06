function labels=SVM_linearClassify(Model,datas)
    margins = datas * (Model.W)'+ repmat((Model.b)',[size(datas,1),1]);
    [~,labels] = max(margins,[],2);
    labels = labels - ones(size(labels));
end
