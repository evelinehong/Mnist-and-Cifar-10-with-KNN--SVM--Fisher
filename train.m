function [Model] = train(X,Y)
    data = [];
    for i = 1 : size(X,1)
        data = [data;naivehog(reshape(X(i,:),[32,32,3]),8)'];
        %disp(i);
    end
    %Model = trainSVM_QuadKernel(data,Y);
    Model = trainKNN(data,Y);
    %Model = trainSVM_linear(data,Y);
    %Model = trainFisherwKernel(data,Y,@poly2,2000);
    %Model = trainFisher(data,Y);
end

