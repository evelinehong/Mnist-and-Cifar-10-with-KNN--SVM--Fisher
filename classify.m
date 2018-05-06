function Y = classify(Model,X)
    data = [];
    for i = 1 : size(X,1)
        data = [data;naivehog(reshape(X(i,:),[32,32,3]),8)'];
    end
    %Y = SVM_linearClassify(Model,data);
    Y = KNNclassify(Model,data);
    %Y = SVM_QuadKernelClassify(Model,data);
    %Y = FisherwKernelClassify(Model,data,@poly2);
    %Y = FisherClassify(Model,data);
end

