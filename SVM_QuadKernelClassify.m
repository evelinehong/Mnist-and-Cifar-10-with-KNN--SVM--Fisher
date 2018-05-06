function labels=SVM_QuadKernelClassify(Model,datas)
    numClass=size(Model.b,1);
    margins=zeros(size(datas,1),numClass);
    for i=1:numClass
        kernel=(Model.SV{i}*datas'+1).^2;
        margins(:,i)=((Model.alpha_sv{i}.*Model.label_sv{i})'*kernel)'+ Model.b(i,1);
    end
    [~,labels] = max(margins,[],2);
    labels = labels - ones(size(labels));
end